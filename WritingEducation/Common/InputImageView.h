//
//  InputImageView.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "BaseView.h"
#import "DefineMacro.h"

@interface InputImageView : BaseView

@property(nonatomic,strong)UIImageView *backImgView;
@property(nonatomic,strong)UIImageView *contentImgView;
@property(nonatomic,strong)UITextField *textField;

-(instancetype)initWithFrame:(CGRect)frame backImg:(NSString*)backImg contentImg:(NSString *)contentImg;

@end
