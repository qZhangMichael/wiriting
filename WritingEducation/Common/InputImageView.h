//
//  InputImageView.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "BaseView.h"
#import "DefineMacro.h"

@interface InputImageView : BaseView <UITextFieldDelegate>
//背景图片
@property(nonatomic,strong)UIImageView *backImgView;
//头部内容图片
@property(nonatomic,strong)UIImageView *contentImgView;
//右箭头
@property(nonatomic,strong)UIImageView *rightImgView;
//内容
@property(nonatomic,strong)UITextField *textField;
//代理
@property(nonatomic,weak)id delegate;

-(instancetype)initWithFrame:(CGRect)frame backImg:(NSString*)backImg contentImg:(NSString *)contentImg;

@end
