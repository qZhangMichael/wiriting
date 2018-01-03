//  PersonInfoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/2.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "InputImageView.h"
#import "PhotoCollectionView.h"

@interface PersonInfoViewController ()<PhotoCollectionViewDelegate>

@property(nonatomic,strong)InputImageView *phoneImgView;
@property(nonatomic,strong)InputImageView *cardImgView;
@property(nonatomic,strong)InputImageView *schoolImgView;
@property(nonatomic,strong)InputImageView *levelImgView;

@property(nonatomic,strong)PhotoCollectionView *collectionView;


@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"基本信息";
    [self initWithView];
   
}

-(void)initWithView{
    
    CGFloat topGap = 30*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    
    _phoneImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"15.png"];
    _phoneImgView.textField.placeholder = @"请输入手机号码";
    [self.view addSubview:_phoneImgView];
    [_phoneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(topGap, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(Height);
    }];
    
    _cardImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"5.png"  contentImg:@"16.png"];
    _cardImgView.textField.placeholder = @"XXXXXXXXXXXXXXXXXXX";
    [self.view addSubview:_cardImgView];
    [_cardImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_phoneImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height);
    }];
    
    _schoolImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"11.png"  contentImg:@"17.png"];
    _schoolImgView.textField.placeholder = @"XX学校";
    [self.view addSubview:_schoolImgView];
    [_schoolImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_cardImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height);
    }];
    
    _levelImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"10.png"  contentImg:@"19.png"];
    _levelImgView.textField.placeholder = @"金牌老师";
    [self.view addSubview:_levelImgView];
    [_levelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_schoolImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height);
    }];
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, Height*2) dataArray:@[@{},@{},@{}]];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_levelImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height*2);
    }];
    _collectionView.photoCollectionDelegate = self;

}

-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
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
