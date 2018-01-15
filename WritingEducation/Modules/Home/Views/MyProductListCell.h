//
//  TableViewCell.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/11.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface MyProductListCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *writingTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *scoreLb;
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLb;
@property (weak, nonatomic) IBOutlet UILabel *statusLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;

@end
