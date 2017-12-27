//
//  BaseViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = MAIN_GROUNDCOLOR;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self setReturnButton];
}

-(void)setReturnButton{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [button setTitle:@"<返回" forState:UIControlStateNormal];
    // 设置返回按钮触发的事件
    [button addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    // 初始化一个BarButtonItem，并将其设置为返回的按钮的样式
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    // 将BarButtonItem添加到LeftBarButtonItem上
    self.navigationItem.leftBarButtonItem = backButton;
}

-(void)returnButtonPressed{
    
     [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
