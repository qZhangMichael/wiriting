//
//  SignStudentModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/8.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface SignStudentModel : RequestModel

@property(nonatomic,strong)NSString *accountType;
@property(nonatomic,assign)NSInteger age; //0
@property(nonatomic,assign)NSInteger gradeCode; //0
@property(nonatomic,strong)NSString *gradeDesc;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *registeredTime;
@property(nonatomic,strong)NSString *schoolName;

@end
