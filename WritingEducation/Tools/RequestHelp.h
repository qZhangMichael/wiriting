//
//  RequestHelp.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/8.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestUrl.h"
#import "AFNetWorking.h"
#import "RequestUrl.h"
#import "DefineMacro.h"

//typedef void(^TokenBlock)(NSString *token,NSError *error);

NS_ASSUME_NONNULL_BEGIN

typedef void(^GetBlock)(id _Nullable  responseObject,NSError *error);
typedef void(^PostBlock)(id  responseObject,NSError *error);

typedef void(^ErrorBlock)(NSError *error);
typedef void(^SuccessBlock)(NSError *error);

@interface RequestHelp : NSObject

//-(void)requestToken:(NSString *)user password:(NSString*)password tokenBlock:(TokenBlock)tokenBlock;

-(void)getUrl:(NSString *)url parameters:(id)parameters getBlock:(GetBlock)getBlock;

-(void)postUrl:(NSString *)url parameters:(id)parameters postBlock:(PostBlock)postBlock;

@end

NS_ASSUME_NONNULL_END
