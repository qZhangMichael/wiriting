//
//  HomeViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/13.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property(nonatomic,strong)UIButton*updateBtn;
@property(nonatomic,strong)UIButton*writingBtn;
@property(nonatomic,strong)UIButton*browseBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Home";
    [self initWithView];
    [self initWithTabBarView];
}

-(void)initWithView{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"photo-1.png"] forState:UIControlStateNormal ];
    leftBtn.frame= CGRectMake(0, 0, 20, 20);
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"photo-2.png"] forState:UIControlStateNormal ];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

-(void)initWithTabBarView{
    
    CGFloat height = 70;
    
    _updateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_updateBtn setImage:[UIImage imageNamed:@"photo-6"] forState:UIControlStateNormal];
    [_updateBtn setImage:[UIImage imageNamed:@"photo-5"] forState:UIControlStateSelected];
    [_updateBtn addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_updateBtn];
    _updateBtn.selected = YES;
    _updateBtn.tag = 111;
    [_updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, height));
    }];
    _writingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_writingBtn setImage:[UIImage imageNamed:@"photo-6"] forState:UIControlStateNormal];
    [_writingBtn setImage:[UIImage imageNamed:@"photo-5"] forState:UIControlStateSelected];
    [_writingBtn addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_writingBtn];
    _writingBtn.tag = 222;
    [_writingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_updateBtn.mas_right);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, height));
    }];
    _browseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_browseBtn setImage:[UIImage imageNamed:@"photo-6"] forState:UIControlStateNormal];
    [_browseBtn setImage:[UIImage imageNamed:@"photo-5"] forState:UIControlStateSelected];
    [_browseBtn addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_browseBtn];
     _browseBtn.tag = 333;
    [_browseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_writingBtn.mas_right);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, height));
    }];
}

-(void)tabBarClick:(id)action{
    
    UIButton *btn = (UIButton *)action;
    if (btn.tag == 111) {
        _updateBtn.selected=YES;
        _writingBtn.selected=NO;
        _browseBtn.selected=NO;
        self.title =@"上传作文";
    }else if (btn.tag == 222){
        _updateBtn.selected=NO;
        _writingBtn.selected=YES;
        _browseBtn.selected=NO;
        self.title =@"我的作品";
    }else if (btn.tag == 333){
        _updateBtn.selected=NO;
        _writingBtn.selected=NO;
        _browseBtn.selected=YES;
        self.title =@"浏览";
    }
}

-(void)leftBtnClick:(id)action{
    
}

-(void)rightBtnClick:(id)action{
    
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
