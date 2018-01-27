//
//  SelectTeacherViewController.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/25.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseViewController.h"
#import "TeacherResultListMModel.h"

typedef void(^TeacherInfoBlock)(TeacherMModel *teacherModel);

@interface TeacherListViewController : BaseViewController

@property(nonatomic,copy)TeacherInfoBlock teacherInfoBlock;

@end
