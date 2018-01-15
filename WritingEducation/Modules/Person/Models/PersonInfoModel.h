//
//  PersonInfoModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/14.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//
#import "RequestModel.h"

typedef NS_ENUM(NSInteger, AccountType){
    AccountTypeStudent = 0,
    AccountTypeTeacher
};

@interface PersonInfoModel : RequestModel

//老师
@property(nonatomic,assign)AccountType accountType;
@property(nonatomic,strong)NSString *identificationNumber;
@property(nonatomic,strong)NSString *jobTitle;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *registeredTime;
@property(nonatomic,strong)NSString *schoolName;

//学生
@property(nonatomic,assign)NSString *age;
@property(nonatomic,assign)NSString *gradeCode;
@property(nonatomic,strong)NSString *gradeDesc;

@end
