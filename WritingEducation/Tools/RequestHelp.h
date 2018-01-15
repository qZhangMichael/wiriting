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
#import "NSString+RequestHelp.h"

//typedef void(^TokenBlock)(NSString *token,NSError *error);

NS_ASSUME_NONNULL_BEGIN

typedef void(^GetBlock)(id  responseObject);
typedef void(^PostBlock)(id  responseObject);

typedef void(^ErrorBlock)(NSError *error);
typedef void(^SuccessBlock)(NSError *error);

@protocol RequestHelpDelegate <NSObject>

-(void)requestError:(NSError *)error;

@end

@interface RequestHelp : NSObject

@property(nonatomic,weak)id<RequestHelpDelegate>delegate;

-(void)getUrl:(NSString *)url parameters:(id)parameters getBlock:(GetBlock)getBlock;

-(void)postUrl:(NSString *)url parameters:(id)parameters postBlock:(PostBlock)postBlock delegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
