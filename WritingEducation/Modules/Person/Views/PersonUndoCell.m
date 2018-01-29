//
//  PersonUndoCell.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/14.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PersonUndoCell.h"

@implementation PersonUndoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
