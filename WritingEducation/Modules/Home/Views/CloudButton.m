//
//  CloudButton.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/14.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "CloudButton.h"

@interface CloudButton ()
@end

@implementation CloudButton


+(instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)titleStr normalImg:(NSString*)normalImg selectImg:(NSString*)selectImg;{
    
    CloudButton *btn = [CloudButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"bg_upload_btn_un_1.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"bg_upload_btn_1.png"] forState:UIControlStateSelected];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor clearColor];
    btn.selectBtnImg = selectImg;
    btn.normalBtnImg = normalImg;
    
    btn.imgView = [[UIImageView alloc]init];
    [btn addSubview:btn.imgView];
    btn.imgView.image = [UIImage imageNamed:normalImg];
    [btn.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn);
        make.top.equalTo(btn).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    btn.textLb = [[UILabel alloc]init];
    btn.textLb.text = titleStr;
    btn.textLb.textColor = Color(108, 190, 221);
    btn.textLb.font = [UIFont systemFontOfSize:16];
    [btn addSubview:btn.textLb];
    btn.textLb.textAlignment = NSTextAlignmentCenter;
    [btn.textLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn);
        make.top.equalTo(btn.imgView.mas_bottom).with.offset(3);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    return btn;
}

-(void)btnClick:(id)action{
    
    CloudButton *btn = (CloudButton *)action;
    if ([_delegate respondsToSelector:@selector(cloudButtonClick:)]) {
        [_delegate performSelector:@selector(cloudButtonClick:) withObject:btn];
    }
}

-(void)setSelected:(BOOL)selected{

    [super setSelected:selected];
    if (selected) {
        self.imgView.image = [UIImage imageNamed:self.selectBtnImg];
        self.textLb.textColor = Color(255, 255, 255);;
    }else{
        self.imgView.image = [UIImage imageNamed:self.normalBtnImg];
        self.textLb.textColor = Color(108, 190, 221);;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
