//
//  BaseViewController.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineMacro.h"
#import "Masonry.h"
#import "MBProgressHUD.h"
#import "RequestHelp.h"
#import "AppDelegate.h"

@interface BaseViewController : UIViewController

@property(nonatomic,assign)AppDelegate *appdelegate;

-(void)showAlert:(NSString *)msg;

-(void)showLoading;
-(void)hideLoading;
@end
