//
//  LeftMenuViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/18.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "LeftMenuViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "LoginViewController.h"
#import "LeftMenuCell.h"
#import "PersonCenterViewController.h"

static NSString * LABLE_TEXT = @"text";
static NSString * LABLE_ICON = @"icon";

@interface LeftMenuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UIImageView *infoImgView;
@property(nonatomic,strong)UILabel  *infoLabel;

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithData];
    [self initWithView];
    
}


-(void)initWithView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat headerHeight = 150*kPROPORTION;
    UIImageView *headerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leftMesu_7.png"]];
    [headerView setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.mas_equalTo(headerHeight);
    }];
    
    CGFloat topGap = 70*kPROPORTION;
    CGFloat leftGap = 20*kPROPORTION;
    CGFloat sideLength = 60*kPROPORTION;
    _infoImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leftMesu_5.png"]];
    [headerView addSubview:_infoImgView];
    [_infoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.size.mas_equalTo(CGSizeMake(sideLength, sideLength));
    }];
    
    CGFloat lbheight = 20*kPROPORTION;
    _infoLabel = [UILabel new];
    _infoLabel.backgroundColor  = [UIColor clearColor];
    [headerView addSubview:_infoLabel];
    _infoLabel.text = @"xxxx";
    _infoLabel.font = [UIFont systemFontOfSize:20];
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_infoImgView);
        make.left.equalTo(_infoImgView.mas_right).with.offset(leftGap);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.height.mas_equalTo(lbheight);
    }];
    
    CGFloat footerHeight = 150*kPROPORTION;
    UIImageView *footerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leftMesu_6.png"]];
    [self.view addSubview:footerView];
    [footerView setContentMode:UIViewContentModeScaleToFill];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.mas_equalTo(footerHeight);
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(headerHeight, 0, footerHeight, 0));
    }];
}

-(void)initWithData{
    
    _dataArray = @[
                   @{LABLE_ICON:@"leftMesu_1.png",LABLE_TEXT:@"个人中心"},
                   @{LABLE_ICON:@"leftMesu_2.png",LABLE_TEXT:@"修改密码"},
                   @{LABLE_ICON:@"leftMesu_3.png",LABLE_TEXT:@"关于我们"},
                   @{LABLE_ICON:@"leftMesu_4.png",LABLE_TEXT:@"退出登陆"}];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellStr = @"cellStr";
    LeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell==nil) {
        cell = [[LeftMenuCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellStr];
    }
    NSDictionary *dict = _dataArray[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:dict[LABLE_ICON]];
    cell.titleLable.text = dict[LABLE_TEXT];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50*kPROPORTION;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseViewController *vc;
    if (indexPath.row == 0) {
        vc = [PersonCenterViewController new];
    }else{
        vc = [[LoginViewController alloc]init];
    }
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.navigationBar.barTintColor = NavigationColor;
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    nav.navigationBar.translucent = NO;
    [self.sideMenuViewController setContentViewController:nav animated:YES];
    [self.sideMenuViewController hideMenuViewController];

}

-(void)didReceiveMemoryWarning {
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
