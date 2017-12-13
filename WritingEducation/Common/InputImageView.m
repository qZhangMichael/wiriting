//
//  InputImageView.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "InputImageView.h"

@implementation InputImageView

-(instancetype)initWithFrame:(CGRect)frame backImg:(NSString*)backImg contentImg:(NSString *)contentImg{
    
    if ([super initWithFrame:frame]) {
        
        CGFloat height = 45*kPROPORTION;
        CGFloat  sizeContent = 30*kPROPORTION;
        CGFloat  gap = 4*kPROPORTION;
        
        _backImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _backImgView.image = [UIImage imageNamed:backImg];
        [self addSubview:_backImgView];
        [_backImgView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        _contentImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _contentImgView.image = [UIImage imageNamed:contentImg];
        [self addSubview:_contentImgView];
        [_contentImgView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).with.offset(gap*2);
            make.size.mas_equalTo(CGSizeMake(sizeContent, sizeContent));
        }];
        
        _textField = [[UITextField alloc]initWithFrame:CGRectZero];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, height+gap*2, 0, 0));
        }];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
