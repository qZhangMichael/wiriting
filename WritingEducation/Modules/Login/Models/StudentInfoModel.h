//
//  StudentInfoModel.h
//  WritingEducation
//  学生信息model
//  Created by 张琼 on 2018/1/13.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface StudentInfoModel : RequestModel

@property(nonatomic,strong)NSString *accountType;
@property(nonatomic,assign)NSString *age;
@property(nonatomic,assign)NSString *gradeCode;
@property(nonatomic,strong)NSString *gradeDesc;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *registeredTime;
@property(nonatomic,strong)NSString *schoolName;

@end
