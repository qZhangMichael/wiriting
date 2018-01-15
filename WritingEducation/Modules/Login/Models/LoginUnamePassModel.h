//
//  LoginUnamePassModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/10.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "YYModel.h"
#import "StudentInfoModel.h"
#import "TeacherInfoModel.h"
#import "PersonInfoModel.h"

extern NSString *const LOGIN_UNAMEPASS;

@interface LoginUserInfoModel :RequestModel

@property(nonatomic,strong)NSString *accountType;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *registeredTime;

@property(nonatomic,strong)StudentInfoModel *student;
@property(nonatomic,strong)TeacherInfoModel *teacher;

-(BOOL)differentiatePersonType;//YES 学生  NO 老师

@end


@interface LoginUnamePassModel : RequestModel

//输入
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;

//输出
@property(nonatomic,strong)LoginUserInfoModel *loginUserInfoM;

//转成个人信息
-(PersonInfoModel*)convertToPersonInfoModel;

@end
