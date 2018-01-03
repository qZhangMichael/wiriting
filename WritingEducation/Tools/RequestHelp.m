//
//  BIHelp.m
//  sany_crm
//
//  Created by Sany on 2017/3/7.
//  Copyright © 2017年 RIG. All rights reserved.
//
//static NSString *const TICKET_FLAG = @"ticketflag";
//static NSString *const TICKET_DATE = @"ticketdate";


#import "RequestHelp.h"
//#import "RSAEncryptor.h"
#import "AppDelegate.h"
#import "YYModel.h"
#import "Macro.h"
#import "SAMKeychain.h"

NSString *const REQUEST_USER=@"user";

@interface RequestHelp ()


@property(nonatomic,copy)NSString *ticketUrl;
@property(nonatomic,copy)NSString *tokenUrl;
@property(nonatomic,copy)NSString *logoutUrl;
@property(nonatomic,copy)NSString *rfcUrl;
@property(nonatomic,copy)NSString *testTokenUrl;
@property(nonatomic,copy)NSString *practiceUrl;

@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *passWord;
@property(nonatomic,copy)NSString *tokenStr;
@property(nonatomic,copy)NSString *currentUrl;
@property(nonatomic,assign)BOOL  isLogin;
@property(nonatomic,strong)id postObject;

@property(nonatomic,assign)int requestTokenTimes;//检查token 3次失败
@property(nonatomic,assign)int reusestRfcTimes;//rfc调用 3次失败

@property(nonatomic,copy)void(^loginSuccessBlock)(NSString *msg);
@property(nonatomic,copy)void(^htmlBlock)(NSString*tokenStr);
@property(nonatomic,copy)void(^getBlock)(NSString*jsonStr);
@property(nonatomic,copy)void(^postBlock)(NSString*jsonStr);
@property(nonatomic,copy)void(^getDelegateBlock)(NSString*jsonStr);
@property(nonatomic,copy)void(^postDelegateBlock)(NSString*jsonStr);
@property(nonatomic,copy)void(^getAllInterfaceBlock)(NSString*jsonStr);
@property(nonatomic,copy)void(^postAllInterfaceBlock)(NSString*jsonStr);

@end

NSString *const IS_BASE = @"IS_BASE";
NSString *const FLAG_F=@"FLAG_F";
NSString *const LANGU=@"LANGU";
NSString *const USER=@"USER";

@implementation RequestHelp

-(instancetype)init{
    
    if ([super init]) {
        _requestTokenTimes=0;
    }
    return self;
}


-(void)requestServer:(NSString*)server{
    
    self.ticketUrl=[NSString stringWithFormat:@"%@%@",server,TICKET_URL];
    self.tokenUrl=[NSString stringWithFormat:@"%@%@",server,TOKEN_URL];
    self.logoutUrl=[NSString stringWithFormat:@"%@%@",server,LOGOUT_URL];
    self.rfcUrl=[NSString stringWithFormat:@"%@%@",server,RFC_URL];
    self.testTokenUrl=[NSString stringWithFormat:@"%@%@",server,TESTTOKEN_URL];
    self.practiceUrl=[NSString stringWithFormat:@"%@%@",server,PRACTICE_URL];
    self.serverUrl=server;
}

-(void)loginUser:(NSString*)username password:(NSString*)password success:(void(^)(NSString *msg))success  failure:(void(^)(NSError *  error))failure{
    
    self.loginSuccessBlock = success;
    self.failureBlock = failure;
    self.getBlock = nil;
    self.htmlBlock = nil;
    self.postBlock = nil;
    self.getDelegateBlock = nil;
    self.postDelegateBlock = nil;
    _userName=[username uppercaseStringWithLocale:[NSLocale currentLocale]];
    [[NSUserDefaults standardUserDefaults]setObject:_userName forKey:REQUEST_USER];
    _passWord=password;
    
    [self executeLogin];
    _requestTokenTimes=0;
}

-(void)executeLogin{

        [self gainOfTicket:[self generateTicketUrl]];
}

-(NSString *)generateTicketUrl{
    
    _userName=[[NSUserDefaults standardUserDefaults]objectForKey:REQUEST_USER];
    _passWord=[SAMKeychain passwordForService:BUNDLEID account:USERINFO_PASS];
    NSString *userAndpassword=[NSString stringWithFormat:@"%@:%@",_userName,_passWord];
    NSString *dataFromBase64String=[self encryption:userAndpassword];
    NSString *dataFromBase64Encode = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)dataFromBase64String,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    NSString *ticketUrl=[NSString stringWithFormat:self.ticketUrl,dataFromBase64Encode];
    return ticketUrl;
}

//获得ticket
-(void)gainOfTicket:(NSString*)ticketUrl{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60;
    [manager GET:ticketUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *ticketStr=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        MessageModel *model=[MessageModel yy_modelWithJSON:ticketStr];
        if (model.hasAuth&&!IsEmptyStr(model.msg)) {
            NSLog(@"获取tickt成功%@",ticketStr);
            [[NSUserDefaults standardUserDefaults] setObject:model.msg forKey:TICKET_FLAG];
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:TICKET_DATE];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self gainOfToken:model.msg];
        }else{
            NSString *msg=[NSString stringWithFormat:@"登录失败:%@",model.msg];
            NSError *error = [self getErrorType:RequestErrorTypeNormal message:msg];
            [self executeError:error];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取tickt失败%@",error);
        [self executeError:error];
    }];
}

//获取token
-(void)gainOfToken:(NSString*)tickstr{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *tokenUrl=[NSString stringWithFormat:self.tokenUrl,tickstr];
    [manager GET:tokenUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString * tokenJsonStr=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        MessageModel *model=[MessageModel yy_modelWithJSON:tokenJsonStr];
        if (model.hasAuth&&!IsEmptyStr(model.msg)) {
            NSLog(@"获取token成功%@",tokenJsonStr);
            if (_htmlBlock) {
                _htmlBlock(model.msg);
            }else{
                _tokenStr=model.msg;
                [self checkTokenValid:model.msg];
            }
            _isLogin=YES;
        }else{
            NSString *msg=[NSString stringWithFormat:@"获取token失败:%@",model.msg];
            NSError *error = [self getErrorType:RequestErrorTypeNormal message:msg];
            [self executeError:error];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取token失败%@",error);
        [self executeError:error];
    }];
}
//验证token
-(void)checkTokenValid:(NSString *)token{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _userName=[[NSUserDefaults standardUserDefaults]objectForKey:REQUEST_USER];
    NSString *url=[NSString stringWithFormat:self.testTokenUrl,_userName,token];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString * jsonStr=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if ([jsonStr isEqualToString:@"welcome"]) {
            _requestTokenTimes=0;
            NSLog(@"检查token成功");
            _isLogin=YES;
            if(_loginSuccessBlock){
                _loginSuccessBlock(jsonStr);
            }
            if (_getBlock) {
                [self getInforUrl:_currentUrl success:_getBlock failure:_failureBlock];
            }
            if (_postBlock) {
            [self postInforUrl:_currentUrl params:_postObject success:_postBlock failure:_failureBlock];
            }
            if (_getDelegateBlock) {
                [self getInforUrl:_currentUrl success:_getDelegateBlock delegate:self.delegate];
            }
            if (_postDelegateBlock) {
                [self postInforUrl:_currentUrl params:_postObject success:_postDelegateBlock delegate:self.delegate];
            }
            if (_getAllInterfaceBlock) {
                [self getAllInterfaceInfoUrl:_currentUrl success:_getAllInterfaceBlock failure:self.failureBlock];
            }
            if (_postAllInterfaceBlock) {
                [self postInforUrl:_currentUrl params:self.postObject success:_postAllInterfaceBlock failure:self.failureBlock];
            }
        }else{
            if (_requestTokenTimes<3) {
                NSLog(@"检查token失败%ld",(long)_requestTokenTimes);
                [self executeLogin];
            }else{
                _requestTokenTimes=0;
                NSString *msg = [NSString stringWithFormat:@"%@:%@",@"检查token失败Last",jsonStr];
                NSError *error = [self getErrorType:RequestErrorTypeNormal message:msg];
                [self executeError:error];
            }
            _requestTokenTimes++;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _requestTokenTimes = 0;
        NSLog(@"检查token失败Last");
        [self executeError:error];
    }];
}

#pragma mark  get - put 获取token用于HTML页面访问
-(void)requestHtmlToken:(void(^)(NSString*tokenStr))htmlBlock failure:(void(^)(NSError *  error))failure{
    
    self.failureBlock = failure;
    [self executeLogin];
    self.htmlBlock = htmlBlock;
    self.getBlock = nil;
    self.postBlock = nil;
    self.getDelegateBlock = nil;
    self.postDelegateBlock = nil;
}

#pragma mark  get - put RFC block类型
-(void)getInforUrl:(NSString *)url success:(void(^)(NSString*jsonStr))success  failure:(void(^)(NSError *error))failure{
    
    _getBlock=success;
    self.htmlBlock = nil;
    self.postBlock = nil;
    self.getDelegateBlock = nil;
    self.postDelegateBlock = nil;
    _currentUrl=url;
    NSString *urlStr =[NSString stringWithFormat:self.practiceUrl,url];
    _failureBlock=failure;
    [self getRequest:urlStr success:success];
}


-(void)postInforUrl:(NSString *)url params:(id)object success:(void(^)(NSString*jsonStr))success  failure:(void(^)(NSError *error))failure{
    
    self.getBlock = nil;
    self.postBlock=success;
    self.htmlBlock = nil;
    self.getDelegateBlock = nil;
    self.postDelegateBlock = nil;
    self.postObject=object;
    _currentUrl=url;
    NSString *urlStr =[NSString stringWithFormat:self.practiceUrl,url];
    _failureBlock=failure;
    [self postRequest:urlStr parmeter:object success:success];
}

#pragma mark  get - put RFC delegate类型
-(void)getInforUrl:(NSString *)url success:(void(^)(NSString*jsonStr))success delegate:(id)delegate{
    
    self.getBlock=nil;
    self.htmlBlock = nil;
    self.postBlock = nil;
    self.getDelegateBlock = success;
    self.postDelegateBlock = nil;
    _currentUrl=url;
    NSString *urlStr =[NSString stringWithFormat:self.rfcUrl,url];
    self.delegate=delegate;
    [self getRequest:urlStr success:success];
}

-(void)postInforUrl:(NSString *)url params:(id)object success:(void(^)(NSString*jsonStr))success  delegate:(id)delegate{
    
    self.postObject=nil;
    self.getBlock = nil;
    self.htmlBlock = nil;
    self.getDelegateBlock = nil;
    self.postDelegateBlock = success;
    self.postObject=object;
    _currentUrl=url;
    NSString *urlStr =[NSString stringWithFormat:self.rfcUrl,url];
    self.delegate=delegate;
    [self postRequest:urlStr parmeter:object success:success];
}

#pragma mark ============= 统一调用方法===============
-(void)getAllInterfaceInfoUrl:(NSString *)url success:(void(^)(NSString *jsonStr))success  failure:(void(^)(NSError *error))failure{
    
    self.getAllInterfaceBlock = success;
    _currentUrl = url;
    self.failureBlock = failure;
    NSString *urlStr =[NSString stringWithFormat:@"%@%@",self.serverUrl,url];
    [self getRequest:urlStr success:success];
}

-(void)postAllInterfaceInfoUrl:(NSString *)url params:(id)object success:(void(^)(NSString *jsonStr))success  failure:(void(^)(NSError *error))failure{

    self.postAllInterfaceBlock = success;
    _currentUrl = url ;
    self.failureBlock = failure;
    self.postObject = object;
    NSString *urlStr =[NSString stringWithFormat:@"%@%@",self.serverUrl,url];
    [self postRequest:urlStr parmeter:object success:success];
}

#pragma mark    =====注销=======
-(void)Logout:(void(^)(NSString*jsonStr))success  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:self.logoutUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:TICKET_FLAG];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:TICKET_DATE];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (success) {
            success(jsonStr);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark ======
-(void)getRequest:(NSString *)url success:(void(^)(NSString*jsonStr))success{

    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if ([jsonStr containsString:@"登录页面"]) {
            //token失效 返回登录页
//            _reusestRfcTimes=0;
            if (_reusestRfcTimes<3) {
                [self executeLogin]; ;
            }else{
                [self getErrorType:RequestErrorTypeExceptions message:@"登录成功，但无法正常调用RFC接口"];
            }
            _reusestRfcTimes++;
        }else{
            _reusestRfcTimes=0;
            //正常返回数据
            if (success) {
                success(jsonStr);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        _reusestRfcTimes=0;
        [self executeError:error];
    }];
}

-(void)postRequest:(NSString *)url parmeter:(id)object success:(void(^)(NSString*jsonStr))success {

    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:object progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if ([jsonStr containsString:@"登录页面"]) {
            //token失效 返回登录页
//            _reusestRfcTimes=0;
            if (_reusestRfcTimes<3) {
                [self executeLogin]; ;
            }else{
                [self getErrorType:RequestErrorTypeExceptions message:@"登录成功，但无法正常调用RFC接口"];
            }
            _reusestRfcTimes++;
        }else{
            //正常返回数据
            _reusestRfcTimes=0;
            if (success) {
                success(jsonStr);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _reusestRfcTimes=0;
        [self executeError:error];
    }];
}

-(NSError *)getErrorType:(RequestErrorType)errorType message:(NSString *)message{
    
    NSString *domain = BUNDLEID;
    NSError *error ;
    if (errorType==RequestErrorTypeNormal) {
//        NSString *desc = NSLocalizedString(@"error",message);
        NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : message };
        error= [NSError errorWithDomain:domain
                                   code:5555
                               userInfo:userInfo];
    }else if(errorType==RequestErrorTypeExceptions){
//        NSString *desc = NSLocalizedString(@"service exceptions",message);
        NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : message };
        error= [NSError errorWithDomain:domain
                                   code:6666
                               userInfo:userInfo];
    }
    return error;
}


-(void)executeError:(NSError*)error{
    
    NSLog(@"%@",error);
    if (_failureBlock) {
        _failureBlock(error);
    }
    if([_delegate respondsToSelector:@selector(requestFailure:)])
    {
        [_delegate performSelector:@selector(requestFailure:) withObject:error];
    }
}
///**
// RSA加密函数
//
// @param rawStr 需要解密字符串
//
// @return <#return value description#>
// */
//-(NSString *)encryption:(NSString*)rawStr{
//
//    NSLog(@"RSA加密前:%@", rawStr);
//    //使用.der和.p12中的公钥私钥加密解密
//    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
//    NSString *encryptStr = [RSAEncryptor encryptString:rawStr publicKeyWithContentsOfFile:public_key_path];
//    NSLog(@"RSA加密后:%@",encryptStr);
//    return encryptStr;
//}
///**
// RSA解密函数
//
// @param encryptStr 需要解密字符串
//
// @return <#return value description#>
// */
//-(NSString*)deciphering:(NSString*)encryptStr{
//
//    NSLog(@"RSA解密前:%@",encryptStr);
//    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
//    NSString *decryptionStr= [RSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"123456"];
//    NSLog(@"RSA解密后:%@", decryptionStr);
//
//    return decryptionStr;
//}




@end
@implementation MessageModel


@end
