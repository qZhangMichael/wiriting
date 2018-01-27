//
//  StudentInfoModel.h
//  WritingEducation
//  学生信息model
//  Created by 张琼 on 2018/1/13.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "UserAccountModel.h"

@interface StudentInfoModel : RequestModel

@property(nonatomic,strong)NSString *accountType;
@property(nonatomic,assign)NSString *age; //年龄
@property(nonatomic,assign)NSString *gradeCode;//年级代码
@property(nonatomic,strong)NSString *gradeDesc;//年级
@property(nonatomic,strong)NSString *name;//姓名
@property(nonatomic,strong)NSString *password;//手机号码
@property(nonatomic,strong)NSString *phoneNumber;//学校
@property(nonatomic,strong)NSString *registeredTime;
@property(nonatomic,strong)NSString *schoolName;

@property(nonatomic,strong)UserAccountModel *UserAccount;//账号信息

@end
