//
//  LoginUnamePassModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/10.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "YYModel.h"
extern NSString *const LOGIN_UNAMEPASS;

@interface LoginUnamePassModel : RequestModel

@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;

@end
