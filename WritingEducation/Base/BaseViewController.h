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

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#define IsStudentRole  (self.appdelegate.personInfoModel.accountType==AccountTypeStudent)

#define GlobalUserInfo self.appdelegate.personInfoModel

@interface BaseViewController : UIViewController

@property(nonatomic,assign)AppDelegate *appdelegate;

-(void)showAlert:(NSString *)msg;

-(void)showLoading;
-(void)hideLoading;

//返回按钮点击
-(void)returnButtonPressed;

@end
