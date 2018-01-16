//
//  TeacherListModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "TeacherMModel.h"

extern NSString *const TEACHER_LIST;

@interface TeacherResultListMModel : RequestModel

//输入
@property(nonatomic,strong)NSString *jobTitle;// 职称/等级，不传参查所有 ,
@property(nonatomic,strong)NSString *phoneNumber;// 手机号码/账号，不传参查所有

//输出
@property(nonatomic,strong)NSArray *teacherMList;//(Array[TeacherM], optional): 教师列表详细信息

@end
