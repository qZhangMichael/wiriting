//
//  ScoreView.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/17.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "TextImageView.h"

@implementation TextImageView

-(instancetype)initWithFrame:(CGRect)frame backgroudImg:(NSString *)backgroudImg content:(NSString *)content edg:(UIEdgeInsets)edg{
   
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.backgroundImgView];
        self.backgroundImgView.userInteractionEnabled = YES;
        self.backgroundImgView.image = [UIImage imageNamed:backgroudImg];
        [self.backgroundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        self.contentText.text = content;
        self.contentText.backgroundColor = [UIColor clearColor];
        [self.backgroundImgView addSubview:self.contentText];
        [self.contentText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.backgroundImgView).with.insets(edg);
        }];
    }
    return self;
}


-(UIImageView *)backgroundImgView{
    
    if (_backgroundImgView == nil) {
        _backgroundImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _backgroundImgView;
}

-(UITextView*)contentText{
    
    if (_contentText == nil) {
        _contentText = [[UITextView alloc]initWithFrame:CGRectZero];
    }
    return _contentText;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
