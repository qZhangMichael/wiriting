//
//  TokenModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/8.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface TokenModel : NSObject

@property(nonatomic,strong)NSString *access_token;
@property(nonatomic,strong)NSString *token_type;
@property(nonatomic,strong)NSString *expires_in;
@property(nonatomic,strong)NSString *scope;
@property(nonatomic,strong)NSString *jti;

@end
