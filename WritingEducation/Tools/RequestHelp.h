//
//  BIHelp.h
//  sany_crm
//
//  Created by Sany on 2017/3/7.
//  Copyright © 2017年 RIG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


#define TICKET_URL       @"/SanyMOBBI/token/genTicketRsaWithJson?checkType=CRM&cipher=%@"
#define TOKEN_URL        @"/SanyMOBBI/token/getTokenWithJson/%@"
#define LOGOUT_URL       @"/SanyMOBBI/logout"
#define TESTTOKEN_URL    @"/SanyMOBBI/target/%@/%@?redirectUrl=/welcome"
#define PRACTICE_URL     @"/SanyMOBBI/crmapp/%@"
#define RFC_URL          @"/SanyMOBBI/crmapp/excuteRfcV2?rfcName=%@"
#define MESSAGE_URL(r)   [NSString stringWithFormat:@"%@%@",server,r]
//#define

//开发环境
#define DEVELOPMENT_SERVER    @"http://10.0.14.21:8888"
//测试环境
#define TEST_SERVER           @"http://sim.sany.com.cn:90"
//国内环境
#define PRODUCTION_SERVER     @"https://sim.sany.com.cn:8443"
//美国服务器
#define PRODUCTION_AM_SERVER   @"https://smpprd-usa.sanygroup.com:8443"
//泰国服务器
#define PRODUCTION_THA_SERVER   @"https://sim.sany.com.cn:8443"

typedef NS_ENUM(NSInteger,RequestErrorType) {
    RequestErrorTypeNormal,
    RequestErrorTypeExceptions
};

NS_ASSUME_NONNULL_BEGIN

@protocol RequestHelpDelegate <NSObject>

-(void)requestFailure:(NSError *)error;

@end

extern NSString *const REQUEST_USER;

@interface RequestHelp : NSObject

@property(nonatomic,weak)id<RequestHelpDelegate>delegate;
@property(nonatomic,copy)NSString *serverUrl;
@property(nonatomic,copy)void(^failureBlock)(NSError * error);

-(void)loginUser:(NSString*)username password:(NSString*)password success:(void(^)(NSString *msg))success  failure:(void(^)(NSError *  error))failure;

-(void)Logout:(void(^)(NSString*jsonStr))success  failure:(void(^)(NSError *error))failure;

-(void)requestHtmlToken:(void(^)(NSString*tokenStr))htmlBlock failure:(void(^)(NSError *  error))failure;

//RFC 少数个别需要拼写字符串 以及需要自己处理问题
-(void)getInforUrl:(NSString *)url success:(void(^)(NSString*jsonStr))success  failure:(void(^)(NSError *error))failure;

-(void)postInforUrl:(NSString *)url params:(id)object success:(void(^)(NSString*jsonStr))success  failure:(void(^)(NSError *error))failure;

////RFC 统一调用方法
//-(void)getInforUrl:(NSString *)url success:(void(^)(NSString*jsonStr))success delegate:(id)delegate;
//
//-(void)postInforUrl:(NSString *)url params:(id)object success:(void(^)(NSString*jsonStr))success  delegate:(id)delegate;

@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface MessageModel : NSObject

@property(nonatomic,strong)NSString *  msg;
@property(nonatomic,assign)BOOL hasAuth;

@end
NS_ASSUME_NONNULL_END
