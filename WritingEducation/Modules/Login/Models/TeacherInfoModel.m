//
//  TeacherInfoModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/13.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "TeacherInfoModel.h"

@implementation TeacherInfoModel

-(NSDictionary*)modelConvertDict{
    
    NSMutableDictionary *mutdict = [NSMutableDictionary dictionary];
    mutdict[@"accountType"] = self.accountType;
    mutdict[@"identificationNumber"] = self.identificationNumber;
    mutdict[@"jobTitle"] = self.jobTitle;
    mutdict[@"name"] = self.name;
    mutdict[@"password"] = self.password;
    mutdict[@"phoneNumber"] = self.phoneNumber;
    mutdict[@"registeredTime"] = self.registeredTime;
    mutdict[@"schoolName"] = self.schoolName;
    return (NSDictionary*)mutdict;
}
@end
