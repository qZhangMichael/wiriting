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

@property(nonatomic,strong)NSString *requestUrl;
@property(nonatomic,strong)id requestObject;

@end

@implementation RequestHelp

-(void)requestToken{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
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
            [self getUrl:_requestUrl parameters:_requestObject getBlock:_getBlock];
        }
        if (_postBlock) {
            [self postUrl:_requestUrl parameters:_requestObject postBlock:_postBlock delegate:_delegate];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        if(_errorBlock){
            _errorBlock(error);
        }
    }];
}

-(void)getUrl:(NSString *)url parameters:(id)parameters getBlock:(GetBlock)getBlock{
    
    NSString *token = [KUserDefaults objectForKey:tokenRequestStr];
    _requestUrl = [NSString stringWithFormat:@"%@/%@",HEADER_URI,url];
    _requestObject = parameters;
    _getBlock = getBlock;
    if (!IsEmptyStr(token)) {
        AFHTTPSessionManager *afManager = [AFHTTPSessionManager manager];
        afManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        afManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [afManager.requestSerializer setValue:token  forHTTPHeaderField:@"token_type"];
        [afManager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }else{
        [self requestToken];
    }
}

-(void)postUrl:(NSString *)url parameters:(id)parameters postBlock:(PostBlock)postBlock delegate:(id)delegate{
    
    NSString *token = [KUserDefaults objectForKey:tokenRequestStr];
    _requestUrl = [NSString stringWithFormat:@"%@%@",HEADER_URI,url];
    _requestObject = parameters;
    _postBlock = postBlock;
    _delegate = delegate;
    if (!IsEmptyStr(token)) {
        AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager.requestSerializer setValue: [NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:_requestUrl parameters:nil error:nil];
        [request addValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
        [request addValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
        NSData *body  =[parameters dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
        [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *_Nonnull response, id _Nullable responseObject,NSError * _Nullable error){
           
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
            if([str containsString:@"invalid_token"]){
                //token失效时返回了一个页面
                [self requestToken];
                return ;
            }
           
            if (error) {
//                if (error.code == -1011) {
//                    [self requestToken];
//                }else{
                    if ([self.delegate respondsToSelector:@selector(requestError:)]) {
                        [self.delegate performSelector:@selector(requestError:) withObject:error];
                    }
//                }
                return ;
            }
            if (_postBlock) {
                _postBlock(responseObject);
            }
        }] resume];
    }else{
        [self requestToken];
    }
}

@end
