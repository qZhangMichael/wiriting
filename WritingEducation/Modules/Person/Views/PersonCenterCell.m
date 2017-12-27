//
//  PersonCenterCell.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/27.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "PersonCenterCell.h"

CGFloat cellHeight = 50;

@implementation PersonCenterCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat leftRightGap = 30*kPROPORTION;
        CGFloat upDownGap = 5*kPROPORTION;
        
        UIImageView *bgImgView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_15.png"]];
        [self addSubview:bgImgView];
        [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(upDownGap, leftRightGap, upDownGap, leftRightGap));
        }];
        
        CGFloat leftGap = 20*kPROPORTION;
        CGFloat sideLength = 24*kPROPORTION;
        _imgView = [[UIImageView alloc]init];
        [self addSubview:_imgView];
        [_imgView  mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(bgImgView).with.offset(leftGap);
            make.centerY.equalTo(bgImgView);
            make.size.mas_equalTo(CGSizeMake(sideLength, sideLength));
        }];
        
        UIImageView *rightImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_1"]];
        [self addSubview:rightImgView];
        [rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(bgImgView);
            make.right.equalTo(bgImgView.mas_right).with.offset(-leftGap);
            make.size.mas_equalTo(CGSizeMake(15*kPROPORTION, 20*kPROPORTION));
        }];
        
        _txtLable = [UILabel new];
        [self addSubview:_txtLable];
        _txtLable.text = @"特级";
        [_txtLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imgView.mas_right).with.offset(leftGap/2);
            make.centerY.equalTo(bgImgView);
            make.size.mas_equalTo(CGSizeMake(200*kPROPORTION,sideLength));
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
