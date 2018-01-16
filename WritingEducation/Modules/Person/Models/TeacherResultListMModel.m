//
//  TeacherListModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "TeacherResultListMModel.h"

NSString *const TEACHER_LIST =@"/soundapp/writer/teacher/list";

@implementation TeacherResultListMModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"teacherMList":[TeacherMModel class]
             };
}

@end
