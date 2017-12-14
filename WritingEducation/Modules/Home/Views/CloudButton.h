//
//  CloudButton.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/14.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseButton.h"

@protocol  CloudButtonDelegate <NSObject>

-(void)cloudButtonClick:(id)action;

@end

@interface CloudButton : BaseButton

@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *textLb;
@property(nonatomic,strong)NSString *selectBtnImg;
@property(nonatomic,strong)NSString *normalBtnImg;

@property(nonatomic,weak)id<CloudButtonDelegate>delegate;

+(instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)titleStr normalImg:(NSString*)normalImg selectImg:(NSString*)selectImg;

@end
