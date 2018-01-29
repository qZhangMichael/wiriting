//
//  TeacherProductDetailViewController.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseViewController.h"
#import "AgentMModel.h"

typedef NS_ENUM(NSInteger,TeacherProductDetailType) {
    TeacherProductDetailTypeUndo,
    TeacherProductDetailTypeReaded
};

@interface TeacherProductDetailViewController : BaseViewController

@property(nonatomic,assign)TeacherProductDetailType teacherProductType;
@property(nonatomic,strong)AgentMModel *agentMModel;

@end
