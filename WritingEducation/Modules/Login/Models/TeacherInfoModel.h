//
//  TeacherInfoModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/13.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface TeacherInfoModel : RequestModel

@property(nonatomic,strong)NSString *accountType;
@property(nonatomic,strong)NSString *identificationNumber;
@property(nonatomic,strong)NSString *jobTitle;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *registeredTime;
@property(nonatomic,strong)NSString *schoolName;

@end
