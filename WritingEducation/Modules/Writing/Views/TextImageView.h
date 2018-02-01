//
//  ScoreView.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/17.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseView.h"
#import "UITextView+Placeholder.h"

@interface TextImageView : BaseView

@property(nonatomic,strong)UIImageView *backgroundImgView;
@property(nonatomic,strong)UITextView *contentText;


-(instancetype)initWithFrame:(CGRect)frame backgroudImg:(NSString *)backgroudImg content:(NSString *)content edg:(UIEdgeInsets)edg;

@end
