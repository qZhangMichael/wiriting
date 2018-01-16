//
//  TeacherMModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "TeacherMModel.h"

@implementation TeacherMModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"qualificationCertificateList":[QualificationCertificateModel class],
             @"teacherPrice":[TeacherPriceModel class],
             @"userAccount":[UserAccountModel class]
             };
}

@end
