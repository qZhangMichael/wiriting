//
//  LoginUnamePassModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/10.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "LoginUnamePassModel.h"

NSString *const LOGIN_UNAMEPASS  =  @"/soundapp/writer/login/unamepass";

@implementation LoginUserInfoModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"student":[StudentInfoModel class],
             @"teacher":[TeacherInfoModel class]
             };
}
-(BOOL)differentiatePersonType{
    
    if ([self.accountType isEqualToString:@"student"]) {
        return YES;
    }
    return NO;
}
@end

@implementation LoginUnamePassModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{
             @"loginUserInfoM":[LoginUserInfoModel class]
             };
}

-(PersonInfoModel*)convertToPersonInfoModel{
    
    PersonInfoModel *model = [PersonInfoModel new];
    if (![self.loginUserInfoM differentiatePersonType]) {
        model.accountType = AccountTypeTeacher;
        model.identificationNumber = self.loginUserInfoM.teacher.identificationNumber;
        model.jobTitle = self.loginUserInfoM.teacher.jobTitle;
        model.name = self.loginUserInfoM.teacher.name;
        model.password = self.loginUserInfoM.teacher.password;
#warning 此处是有争议需要讨论 错误点err.text 中3.4点
//        model.phoneNumber = self.loginUserInfoM.teacher.phoneNumber;
        model.phoneNumber = self.loginUserInfoM.phoneNumber;
        model.registeredTime = self.loginUserInfoM.teacher.registeredTime;
        model.schoolName = self.loginUserInfoM.teacher.schoolName;
    }else{
        model.accountType = AccountTypeStudent;
        model.age = self.loginUserInfoM.student.age;
        model.gradeCode = self.loginUserInfoM.student.gradeCode;
        model.gradeDesc = self.loginUserInfoM.student.gradeDesc;
        model.name = self.loginUserInfoM.student.name;
        model.password = self.loginUserInfoM.student.password;
        model.phoneNumber = self.loginUserInfoM.student.phoneNumber;
        model.registeredTime = self.loginUserInfoM.student.registeredTime;
        model.schoolName = self.loginUserInfoM.student.schoolName;
    }
    return model;
}
@end
