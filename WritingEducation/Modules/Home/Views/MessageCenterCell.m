//
//  MessageCenterCell.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "MessageCenterCell.h"

@implementation MessageCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
