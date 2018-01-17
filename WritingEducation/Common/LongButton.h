//
//  LongButton.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/12.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapHandler)(UIButton *sender);

@interface LongButton : UIButton

@property(nonatomic,strong)tapHandler hander;


+(id)buttonWithType:(UIButtonType)buttonType title:(NSString *)title image:(NSString *)img handler:(tapHandler)hander;

@end
