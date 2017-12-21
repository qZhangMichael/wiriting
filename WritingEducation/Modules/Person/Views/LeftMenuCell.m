//
//  LeftMenuCell.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/20.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "LeftMenuCell.h"

@implementation LeftMenuCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat leftGap = 20*kPROPORTION;
        CGFloat sideSize = 30*kPROPORTION;
        _imgView = [[UIImageView alloc]init];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(leftGap);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(sideSize, sideSize));
        }];
        
        _titleLable = [UILabel new];
        [self addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imgView.mas_right).with.offset(leftGap/2);
            make.centerY.equalTo(self);
            make.right.equalTo(self).with.offset(-leftGap);
            make.height.mas_equalTo(sideSize);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
