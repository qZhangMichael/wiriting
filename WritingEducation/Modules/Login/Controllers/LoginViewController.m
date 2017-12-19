//
//  LoginViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "LoginViewController.h"
#import "SignInViewController.h"
#import "InputImageView.h"
#import "LongButton.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@property(nonatomic,strong)UITextField *usertTf;
@property(nonatomic,strong)UITextField *passTf;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    [self initWithView];
}

-(void)initWithView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(signin:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    CGFloat leftGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    CGFloat topGap = 10*kPROPORTION;
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    imgView.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(topGap*6);
        make.size.mas_equalTo(CGSizeMake(120*kPROPORTION, 120*kPROPORTION));
    }];
    
    InputImageView *userImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"3.png"];
    userImgView.textField.placeholder = @"请输入用户名/手机号码";
    [self.view addSubview:userImgView];
    [userImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(imgView.mas_bottom).with.offset(topGap*4);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.height.mas_equalTo(Height);
    }];
    
    InputImageView *passImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"5.png" contentImg:@"4.png"];
    passImgView.textField.placeholder = @"请输入登录密码";
    [self.view addSubview:passImgView];
    [passImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(userImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.height.mas_equalTo(Height);
    }];
    
    LongButton *loginBtn =[LongButton buttonWithType:UIButtonTypeCustom title:@"登  录" image:@"6.png" handler:^(UIButton *sender) {
        NSLog(@"登  陆");
        HomeViewController *vc = [HomeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(passImgView);
        make.centerX.equalTo(self.view);
        make.top.equalTo(passImgView.mas_bottom).with.offset(topGap);
    }];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [forgetBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.view addSubview:forgetBtn];
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginBtn.mas_left);
        make.top.equalTo(loginBtn.mas_bottom);
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH-leftGap)/2,Height/3*2));
    }];
    
    UIButton *verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [verifyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [verifyBtn setTitle:@"手机验证码登陆" forState:UIControlStateNormal];
    [verifyBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    verifyBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [verifyBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:verifyBtn];
    [verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(loginBtn.mas_right);
        make.top.equalTo(loginBtn.mas_bottom);
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH-leftGap)/2,Height/3*2));
    }];
    
    UIButton *weixBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [weixBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [weixBtn setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
    [self.view addSubview:weixBtn];
    [weixBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-topGap*4);
        make.size.mas_equalTo(CGSizeMake(35*kPROPORTION, 35*kPROPORTION));
    }];
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.view addSubview:lb];
    lb.font = [UIFont systemFontOfSize:16];
    lb.textColor = [UIColor grayColor];
    lb.text = @"第三方登录";
    lb.textAlignment = NSTextAlignmentCenter;
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(weixBtn.mas_top);
        make.size.mas_equalTo(CGSizeMake(100*kPROPORTION, 50*kPROPORTION));
    }];
    
    UIView *leftLineVw = [[UIView alloc]initWithFrame:CGRectZero];
    leftLineVw.backgroundColor = [UIColor grayColor];
    [self.view addSubview:leftLineVw];
    [leftLineVw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lb);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.right.equalTo(lb.mas_left);
        make.height.mas_equalTo(1);
    }];
    
    UIView *rightLineVw = [[UIView alloc]initWithFrame:CGRectZero];
    rightLineVw.backgroundColor = [UIColor grayColor];
    [self.view addSubview:rightLineVw];
    [rightLineVw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lb);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.left.equalTo(lb.mas_right);
        make.height.mas_equalTo(1);
    }];
}


-(void)signin:(id)action{
    
    SignInViewController *vc = [SignInViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)forgetBtnClick:(id)action{
    
    
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
