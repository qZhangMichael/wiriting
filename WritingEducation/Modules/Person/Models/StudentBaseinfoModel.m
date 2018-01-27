//
//  StudentBaseInfoModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/27.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "StudentBaseInfoModel.h"

NSString *const URL_STUDENT_BASEINFO = @"/soundapp/writer/student/baseinfo/%@";

@implementation StudentBaseInfoModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"studentInfo":[StudentInfoModel class]
             };
}

@end
