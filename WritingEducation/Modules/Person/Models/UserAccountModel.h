//
//  UserAccountModel.h
//  WritingEducation
//  登录基本信息
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface UserAccountModel : RequestModel

@property(nonatomic,strong)NSString *accountType;//账号类型：学生-student;教师-teacher
@property(nonatomic,strong)NSString *password;//登录密码
@property(nonatomic,strong)NSString *phoneNumber;//手机号码
@property(nonatomic,strong)NSString *registeredTime;//注册日期：YYYY-MM-DD HH24:MI:SS

@end
