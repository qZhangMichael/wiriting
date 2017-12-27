//
//  SignInViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/12.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "SignInViewController.h"
#import "InputImageView.h"
#import "LongButton.h"

@interface SignInViewController ()

@property(nonatomic,strong)UIButton *studentBtn;
@property(nonatomic,strong)UIButton *teacherBtn;
@property(nonatomic,strong)InputImageView *nameImgView;
@property(nonatomic,strong)InputImageView *phoneImgView;
@property(nonatomic,strong)InputImageView *passImgView;
@property(nonatomic,strong)InputImageView *levelImgView;
@property(nonatomic,strong)InputImageView *schoolImgView;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    [self initWithView];
}

-(void)initWithView{
    
    CGFloat topGap = 10*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    CGFloat  gap = 4*kPROPORTION;
    
    _studentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_studentBtn setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateSelected];
    [_studentBtn setImage:[UIImage imageNamed:@"14.png"] forState:UIControlStateNormal];
    _studentBtn.tag = 111;
    [_studentBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_studentBtn];
    _studentBtn.selected = YES;
    [_studentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap*4);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.width.mas_equalTo((SCREEN_WIDTH-aroundGap*3)/2);
        make.height.mas_equalTo(Height);
    }];
    
    _teacherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_teacherBtn setImage:[UIImage imageNamed:@"13.png"] forState:UIControlStateSelected];
    [_teacherBtn setImage:[UIImage imageNamed:@"9.png"] forState:UIControlStateNormal];
    [_teacherBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    _teacherBtn.tag = 222;
    [self.view addSubview:_teacherBtn];
    [_teacherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap*4);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.width.mas_equalTo((SCREEN_WIDTH-aroundGap*2-10*kPROPORTION)/2);
        make.height.mas_equalTo(Height);
    }];
    
    _nameImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"3.png"];
    _nameImgView.textField.placeholder = @"请输入学生姓名";
    [self.view addSubview:_nameImgView];
    [_nameImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_studentBtn.mas_bottom).with.offset(topGap*3);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _phoneImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"5.png" contentImg:@"15.png"];
    _phoneImgView.textField.placeholder = @"请输入手机号码";
    [self.view addSubview:_phoneImgView];
    [_phoneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_nameImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _passImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"10.png" contentImg:@"4.png"];
    _passImgView.textField.placeholder = @"请输入登录密码";
    [self.view addSubview:_passImgView];
    [_passImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_phoneImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _levelImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"11.png" contentImg:@"16.png"];
    _levelImgView.textField.placeholder = @"请输入学生年级";
    [self.view addSubview:_levelImgView];
    [_levelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_passImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _schoolImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"17.png"];
    _schoolImgView.textField.placeholder = @"请输入学生学校名称";
    [self.view addSubview:_schoolImgView];
    [_schoolImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_levelImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    UIButton *selectProtocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectProtocolBtn setImage:[UIImage imageNamed:@"12.png"] forState:UIControlStateNormal];
    [selectProtocolBtn setImage:[UIImage imageNamed:@"18.png"] forState:UIControlStateSelected];
    [selectProtocolBtn addTarget:self action:@selector(selectProtocolClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectProtocolBtn];
    [selectProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_schoolImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.size.mas_equalTo(CGSizeMake(Height, Height));
    }];
    
    UIButton *protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    protocolBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [protocolBtn setTitle:@"是否同意XXX协议" forState:UIControlStateNormal];
    [protocolBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [protocolBtn addTarget:self action:@selector(protocolBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:protocolBtn];
    [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selectProtocolBtn);
        make.left.equalTo(selectProtocolBtn.mas_right).with.offset(gap);
        make.height.mas_equalTo(Height);
        make.right.equalTo(self.view).with.offset(-aroundGap);
    }];
    
    LongButton *signInBtn = [LongButton buttonWithType:UIButtonTypeCustom title:@"注  册" image:@"6.png" handler:^(UIButton *sender) {
        NSLog(@"注  册");
    }];
    [self.view addSubview:signInBtn];
    [signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, topGap*2, aroundGap));
        make.height.mas_equalTo(45*kPROPORTION);
    }];
}

-(void)selectType:(id)action{
    
    UIButton *btn = (UIButton*)action;
    if (btn.tag ==111) {
        _studentBtn.selected = YES;
        _teacherBtn.selected = NO;
    }else{
        _studentBtn.selected = NO;
        _teacherBtn.selected = YES;
    }
}

-(void)selectProtocolClick:(id)action{
    
    UIButton *btn = (UIButton*)action;
    btn.selected = !btn.selected;
}

-(void)protocolBtnClick:(id)action{
    
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
