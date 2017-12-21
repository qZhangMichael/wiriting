//
//  PersonCenterViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/20.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "PersonCenterViewController.h"

@interface PersonCenterViewController ()

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UIImageView *infoImgView;
@property(nonatomic,strong)UILabel  *infoLabel;

@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithView];
}

-(void)initWithView{
    
    CGFloat headerHeight = 140*kPROPORTION;
    UIView *headerView = [[UIView alloc]init];
    [headerView setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.mas_equalTo(headerHeight);
    }];
    
    CGFloat topGap = 40*kPROPORTION;//70
    CGFloat bottomGap = 30*kPROPORTION;
    CGFloat leftGap = 20*kPROPORTION;
    UIImageView *bgImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_13.png"]];
    [headerView addSubview:bgImgView];
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(headerView).with.insets(UIEdgeInsetsMake(topGap, leftGap, bottomGap, leftGap));
    }];
    
    CGFloat sideLength = 60*kPROPORTION;
    _infoImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_12.png"]];
    [headerView addSubview:_infoImgView];
    [_infoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImgView).with.offset(leftGap);
        make.centerY.equalTo(bgImgView);
        make.size.mas_equalTo(CGSizeMake(sideLength, sideLength));
    }];
    
    UIImageView *bottomImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_18.png"]];
    [self.view addSubview:bottomImgView];
    [bottomImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(headerView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.equalTo(bgImgView.mas_bottom);
    }];
    
//    CGFloat lbheight = 20*kPROPORTION;
//    _infoLabel = [UILabel new];
//    _infoLabel.backgroundColor  = [UIColor clearColor];
//    [headerView addSubview:_infoLabel];
//    _infoLabel.text = @"xxxx";
//    _infoLabel.font = [UIFont systemFontOfSize:20];
//    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_infoImgView);
//        make.left.equalTo(_infoImgView.mas_right).with.offset(leftGap);
//        make.right.equalTo(self.view).with.offset(-leftGap);
//        make.height.mas_equalTo(lbheight);
//    }];
//
    
//    CGFloat footerHeight = 150*kPROPORTION;
//    UIImageView *footerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leftMesu_6.png"]];
//    [self.view addSubview:footerView];
//    [footerView setContentMode:UIViewContentModeScaleToFill];
//    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        make.height.mas_equalTo(footerHeight);
//    }];
    
//    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:_tableView];
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(headerHeight, 0, footerHeight, 0));
//    }];
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
