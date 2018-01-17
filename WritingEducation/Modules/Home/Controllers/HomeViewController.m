//
//  HomeViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/13.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "HomeViewController.h"
#import "CloudButton.h"
#import "LoginViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "UpdatePhotoViewController.h"
#import "MyProductListViewController.h"
#import "BrowseListViewController.h"
#import "MessageCenterViewController.h"

static CGFloat TabBarHeight = 70;

typedef NS_ENUM(NSInteger, HomeViewType){
    HomeViewTypeUpdatePhoto = 0,
    HomeViewTypeMyProductList,
    HomeViewTypeBrowseList
};

@interface HomeViewController ()<CloudButtonDelegate>

@property(nonatomic,strong)CloudButton*updateBtn;
@property(nonatomic,strong)CloudButton*writingBtn;
@property(nonatomic,strong)CloudButton*browseBtn;

@property(nonatomic,strong)UpdatePhotoViewController *updatePhotoViewController;
@property(nonatomic,strong)MyProductListViewController *myProductListViewController;
@property(nonatomic,strong)BrowseListViewController *browseListViewController;

@property(nonatomic,assign)HomeViewType homeViewType;

@property(nonatomic,strong)BaseViewController *currentViewController;
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
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"photo-2.png"] forState:UIControlStateNormal ];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"bg_upload.png"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIImageView *cameraImageView = [UIImageView new];
    cameraImageView.image = [UIImage imageNamed:@"bg_camera.png"];
    [self.view addSubview:cameraImageView];
    [cameraImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(200);
        make.size.mas_equalTo(CGSizeMake(200, 150));
    }];
    
}

#pragma mark - 切换viewController

-(void)initWithTabBarView{

    _updateBtn = [CloudButton buttonWithType:UIButtonTypeCustom title:@"上传作文" normalImg:@"photo-12-1.png" selectImg:@"photo-9-1.png"];
    [self.view addSubview:_updateBtn];
    _updateBtn.selected = YES;
    _updateBtn.tag = HomeViewTypeUpdatePhoto;
    _updateBtn.delegate =self;
    [_updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, TabBarHeight));
    }];

    _writingBtn = [CloudButton buttonWithType:UIButtonTypeCustom title:@"我的作品" normalImg:@"photo-8.png" selectImg:@"photo-11.png"];
    [self.view addSubview:_writingBtn];
    _writingBtn.tag = HomeViewTypeMyProductList;
    _writingBtn.delegate = self;
    [_writingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_updateBtn.mas_right);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, TabBarHeight));
    }];
    
    _browseBtn = [CloudButton buttonWithType:UIButtonTypeCustom title:@"浏览" normalImg:@"photo-10.png" selectImg:@"photo-13.png"];
    [self.view addSubview:_browseBtn];
    _browseBtn.delegate = self;
    _browseBtn.tag = HomeViewTypeBrowseList;
    [_browseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_writingBtn.mas_right);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, TabBarHeight));
    }];
}



-(void)cloudButtonClick:(id)action{
    
    CloudButton*btn = (CloudButton *)action;
    if (btn.tag == HomeViewTypeUpdatePhoto) {
        _updateBtn.selected=YES;
        _writingBtn.selected=NO;
        _browseBtn.selected=NO;
        self.title =@"上传作文";
    }else if (btn.tag == HomeViewTypeMyProductList){
        _updateBtn.selected=NO;
        _writingBtn.selected=YES;
        _browseBtn.selected=NO;
        self.title =@"我的作品";
    }else if (btn.tag == HomeViewTypeBrowseList){
        _updateBtn.selected=NO;
        _writingBtn.selected=NO;
        _browseBtn.selected=YES;
        self.title =@"浏览";
    }
    [self toViewController:btn.tag];
}

-(void)toViewController:(NSInteger)tag{
    
//    if(tag == self.homeViewType&&self.currentViewController){
        [self.currentViewController willMoveToParentViewController:nil];
        [self.currentViewController removeFromParentViewController];
        [self.currentViewController.view removeFromSuperview];
        self.currentViewController = nil;
//    }else{
        if (tag == HomeViewTypeUpdatePhoto) {
            self.currentViewController = self.updatePhotoViewController;
        }else if (tag == HomeViewTypeMyProductList){
            self.currentViewController = self.myProductListViewController;
        }else if (tag ==HomeViewTypeBrowseList){
            self.currentViewController = self.browseListViewController;
        }
        self.homeViewType = tag;
        [self.view addSubview:self.currentViewController.view];
//    }
}

-(void)leftBtnClick:(id)action{
    
    [self.sideMenuViewController presentLeftMenuViewController];
}

-(void)rightBtnClick:(id)action{
    
    MessageCenterViewController *vc = [MessageCenterViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


-(MyProductListViewController*)myProductListViewController{
    
    if (!_myProductListViewController) {
        _myProductListViewController = [MyProductListViewController new];
        [self addChildViewController:_myProductListViewController];
        [_myProductListViewController.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-TabBarHeight)];
    }
    return _myProductListViewController;
}

-(UpdatePhotoViewController*)updatePhotoViewController{
    
    if (!_updatePhotoViewController) {
        _updatePhotoViewController = [UpdatePhotoViewController new];
        [self addChildViewController:_updatePhotoViewController];
        //    [_updatePhotoViewController didMoveToParentViewController:self];
        [_updatePhotoViewController.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-TabBarHeight)];
    }
    return _updatePhotoViewController;
}

-(BrowseListViewController*)browseListViewController{
    
    if (_browseListViewController) {
        _browseListViewController = [BrowseListViewController new];
        [self addChildViewController:_browseListViewController];
        [_browseListViewController.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-TabBarHeight)];
    }
    return _browseListViewController;
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
