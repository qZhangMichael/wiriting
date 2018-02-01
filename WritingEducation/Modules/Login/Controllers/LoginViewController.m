//
//  LoginViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "LoginViewController.h"
#import "SignInViewController.h"
#import "BaseNavigationViewController.h"
#import "PersonUndoViewController.h"
#import "HomeViewController.h"
//view
#import "InputImageView.h"
#import "LongButton.h"
//model
#import "LoginUnamePassModel.h"


@interface LoginViewController ()

@property(nonatomic,strong)InputImageView *userImgView;
@property(nonatomic,strong)InputImageView *passImgView;

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
    imgView.image = [UIImage imageNamed:@"writing.png"];
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(topGap*6);
        make.size.mas_equalTo(CGSizeMake(120*kPROPORTION, 120*kPROPORTION));
    }];
    
    _userImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"3.png"];
    _userImgView.textField.placeholder = @"请输入用户名/手机号码";
//    _userImgView.textField.text = @"15133332222";
    [self.view addSubview:_userImgView];
    [_userImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(imgView.mas_bottom).with.offset(topGap*4);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.height.mas_equalTo(Height);
    }];
    
    _passImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"5.png" contentImg:@"4.png"];
    _passImgView.textField.placeholder = @"请输入登录密码";
    _passImgView.textField.secureTextEntry = YES;
//    _passImgView.textField.text = @"123456";
    [self.view addSubview:_passImgView];
    [_passImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_userImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.height.mas_equalTo(Height);
    }];
    
    LongButton *loginBtn =[LongButton buttonWithType:UIButtonTypeCustom title:@"登  录" image:@"6.png" handler:^(UIButton *sender) {
        NSLog(@"登  陆");
        [self clickLogin];
    }];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_passImgView);
        make.centerX.equalTo(self.view);
        make.top.equalTo(_passImgView.mas_bottom).with.offset(topGap);
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
    [weixBtn addTarget:self action:@selector(didWeiXinBtnClick:) forControlEvents:UIControlEventTouchUpInside];
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

-(void)didWeiXinBtnClick:(id)action{
    
    
}

-(void)clickLogin{
    
    if (IsEmptyStr(_userImgView.textField.text)) {
        [self showAlert:@"用户名不能为空"];return;
    }else if(IsEmptyStr(_passImgView.textField.text)){
        [self showAlert:@"密码不能为空"];return;
    }
    [self showLoading];
    RequestHelp *requestHelp = [RequestHelp new];
    LoginUnamePassModel *model = [LoginUnamePassModel new];
    model.phoneNumber = _userImgView.textField.text;
    model.password = _passImgView.textField.text;
    NSString *requestStr = [model yy_modelToJSONString];
    [requestHelp postUrl:LOGIN_UNAMEPASS parameters:requestStr postBlock:^(id  _Nonnull responseObject) {
        [self hideLoading];
        LoginUnamePassModel *model = [LoginUnamePassModel yy_modelWithJSON:responseObject];
        if ([model verificationReturnParms]) {
            [KUserDefaults setObject:responseObject forKey:LOGIN_INFO];
            self.appdelegate.personInfoModel = [model convertToPersonInfoModel];
            [self showAlert:model.msg];
            BaseViewController * vc=IsStudentRole?[HomeViewController new]:[PersonUndoViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [self showAlert:[NSString stringWithFormat:@"%@%@",model.error_description,model.msg]];
        }
    } delegate:self];
}



-(void)dealloc{
    
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
