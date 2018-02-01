//
//  RequestHelp.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/8.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestHelp.h"
#import "NSString+Base64.h"
#import "TokenModel.h"

static NSString *const tokenRequestStr = @"tokenStr";

@interface RequestHelp ()

@property(nonatomic,strong)ErrorBlock errorBlock;
@property(nonatomic,strong)GetBlock  getBlock;
@property(nonatomic,strong)PostBlock  postBlock;
@property(nonatomic,strong)PostImgBlock postImgBlock;
@property(nonatomic,strong)NSArray *imgArr;

@property(nonatomic,strong)NSString *requestUrl;
@property(nonatomic,strong)id requestObject;

@end

@implementation RequestHelp

-(void)requestToken{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *userStr = @"service-account-1";
    NSString *passStr = @"service-account-1-secret";
    NSString *authStr = [NSString stringWithFormat:@"%@:%@",userStr,passStr];
    NSString * authorization = [NSString stringWithFormat:@"Basic %@",[authStr base64EncodedString]];
    [manager.requestSerializer setValue:authorization  forHTTPHeaderField:@"Authorization"];
    NSDictionary *params = @{@"grant_type":@"client_credentials"};
    NSString *url = [NSString stringWithFormat:@"%@/%@",HEADER_URI,URI_TOKEN];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TokenModel *model = [TokenModel yy_modelWithJSON:responseObject];
        if (!IsEmptyStr(model.access_token)) {
            [KUserDefaults setObject:model.access_token forKey:tokenRequestStr];
            NSLog(@"------%@",model.access_token);
        }
        if(_getBlock){
            [self getUrl:_requestUrl parameters:_requestObject getBlock:_getBlock delegate:_delegate];
        }
        if (_postBlock) {
            RequestHelp *request =[RequestHelp new];
            [request postUrl:_requestUrl parameters:_requestObject postBlock:_postBlock delegate:_delegate];
        }
        if (_postImgBlock) {
            RequestHelp *request =[RequestHelp new];
            [request postUrl:_requestUrl parameters:_requestObject WithUIImageArray:_imgArr postImgBlock:_postImgBlock delegate:self];
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [self executeError:error];
    }];
}

-(void)getUrl:(NSString *)url parameters:(id)parameters getBlock:(GetBlock)getBlock delegate:(id)delegate{
    
    NSString *token = [KUserDefaults objectForKey:tokenRequestStr];
    _requestUrl = url;
    _requestObject = parameters;
    _getBlock = getBlock;
    _delegate = delegate;
    if (!IsEmptyStr(token)) {
        AFHTTPSessionManager *afManager = [AFHTTPSessionManager manager];
        afManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        afManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [afManager.requestSerializer setValue: [NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
        NSString *urlStr =[NSString stringWithFormat:@"%@%@",HEADER_URI,url];
        [afManager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString * responseStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            if ([self verificationResponse:responseStr error:nil]) {
                if (_getBlock) {
                    _getBlock(responseStr);
                }
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self verificationResponse:nil error:error];
            NSLog(@"%@",error);
        }];
    }else{
        [self requestToken];
    }
}

-(void)postUrl:(NSString *)url parameters:(id)parameters postBlock:(PostBlock)postBlock delegate:(id)delegate{
    
    NSString *token = [KUserDefaults objectForKey:tokenRequestStr];
    _requestUrl = url;
    _requestObject = parameters;
    _postBlock = postBlock;
    _delegate = delegate;
    if (!IsEmptyStr(token)) {
        AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager.requestSerializer setValue: [NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
      NSString *urlStr =[NSString stringWithFormat:@"%@%@",HEADER_URI,url];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlStr parameters:nil error:nil];
        [request addValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
        [request addValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
        NSData *body  =[parameters dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
        [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *_Nonnull response, id _Nullable responseObject,NSError * _Nullable error){
            
            NSString * responseStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            if ([self verificationResponse:responseStr error:error]) {
                if (_postBlock) {
                    _postBlock(responseStr);
                }
            }
        }] resume];
    }else{
        [self requestToken];
    }
}

-(void)postUrl:(NSString *)url parameters:(id)parameters WithUIImageArray:(NSArray<UIImage*> *)imgArr postImgBlock:(PostImgBlock)postImgBlock delegate:(id)delegate{
    
    NSString *token = [KUserDefaults objectForKey:tokenRequestStr];
    _requestUrl = url;
    _requestObject = parameters;
    _postImgBlock = postImgBlock;
    _delegate = delegate;
    _imgArr = imgArr;
    if (!IsEmptyStr(token)) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"image/jpeg",@"image/png",@"application/octet-stream",@"text/json",nil];
        manager.requestSerializer= [AFHTTPRequestSerializer serializer];
        manager.responseSerializer= [AFHTTPResponseSerializer serializer];
        [manager.requestSerializer setValue: [NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
        NSString *urlStr =[NSString stringWithFormat:@"%@%@",HEADER_URI,url];
        [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSDateFormatter *dateFor = [NSDateFormatter new];
            dateFor.dateFormat = @"yyyyMMddHHmmss";
            for (int i =0;i<imgArr.count;i++) {
                UIImage *image = imgArr[i];
                NSData *data = UIImagePNGRepresentation(image);
                NSString *str = @"image/png";
                if (data==nil) {
                    data = UIImageJPEGRepresentation(image,1);
                    str = @"image/jpeg";
                }
                NSString * strName = [NSString stringWithFormat:@"%@%d",[dateFor stringFromDate:[NSDate date]],i];
                 [formData appendPartWithFileData:data name:@"files" fileName:strName mimeType:str];
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString * responseStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            if ([self verificationResponse:responseStr error:nil]) {
                if (_postImgBlock) {
                    _postImgBlock(responseStr);
                }
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self verificationResponse:nil error:error];
        }];
    }
}




//验证返回信息
-(BOOL)verificationResponse:(id)responseObject error:(NSError *)error{
   
    if([responseObject containsString:@"invalid_token"]){
        //token失效时返回了一个页面
        [self requestToken];
        return  NO;
    }
    NSString * errStr = [NSString stringWithFormat:@"%@",error];
    if (!IsEmptyStr(errStr)&&error) {
        if ([errStr containsString:@"unauthorized"]) {
            [self requestToken];
            return NO ;
        }else{
            [self executeError:error];
            return NO ;
        }
    }
    return YES;
}

//执行报错
-(void)executeError:(NSError *)error{
    
    NSLog(@"%@",error);
    if ([self.delegate respondsToSelector:@selector(requestError:)]) {
        [self.delegate performSelector:@selector(requestError:) withObject:error];
    }

}

@end
