//
//  BaseViewController+InputView.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/31.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (InputImageView)

//下拉选择
-(void)toAlertSelect:(UITextField *)textField titleArray:(NSArray <NSString*> *)titleArray;

@end
