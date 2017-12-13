//
//  LongButton.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/12.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "LongButton.h"
#import "Masonry.h"
@implementation LongButton

+(id)buttonWithType:(UIButtonType)buttonType title:(NSString *)title image:(NSString *)img handler:(tapHandler)hander{
    
    LongButton *btn = [LongButton buttonWithType:buttonType];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.hander = hander;
    
    UILabel *lb = [UILabel new];
    lb.text = title;
    lb.textColor = [UIColor whiteColor];
    [btn addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn);
        make.centerY.equalTo(btn);
    }];
    
    return btn;
}

-(void)btnClick:(id)action{
    
    if (self.hander) {
        self.hander(action);
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
