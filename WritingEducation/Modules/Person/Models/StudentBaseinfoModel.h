//
//  StudentBaseInfoModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/27.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "StudentInfoModel.h"

extern NSString *const URL_STUDENT_BASEINFO;

@interface StudentBaseInfoModel : RequestModel

@property(nonatomic,strong)StudentInfoModel *studentInfo;//学生信息详情

@end
