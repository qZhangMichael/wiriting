//
//  TeacherListCell.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/25.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface TeacherListCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLb;
@property (weak, nonatomic) IBOutlet UILabel *teacherLevelLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *timesLb;
@end
