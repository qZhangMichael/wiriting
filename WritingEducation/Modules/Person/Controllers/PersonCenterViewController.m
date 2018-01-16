//
//  PersonCenterViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/20.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "LongButton.h"
#import "PersonCenterCell.h"
#import <RESideMenu/RESideMenu.h>
#import "PersonInfoViewController.h"
#import "LoginViewController.h"

static NSString *LABLE_TEXT = @"text";
static NSString *LABLE_ICON = @"icon";

@interface PersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UIImageView *infoImgView;
@property(nonatomic,strong)UILabel  *nameLabel;
@property(nonatomic,strong)UILabel  *levelLabel;

@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人中心";
    [self initWithData];
    [self initWithView];
}

-(void)initWithData{
    
    _dataArray = @[
                   @{LABLE_ICON:@"leftMesu_1.png",LABLE_TEXT:@"基本信息"},
                   @{LABLE_ICON:@"leftMesu_2.png",LABLE_TEXT:@"待办已阅"},
                   @{LABLE_ICON:@"leftMesu_3.png",LABLE_TEXT:@"我的钱包"}];
}

-(void)initWithView{
        
    CGFloat headerHeight = 150*kPROPORTION;
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
    
    CGFloat sideLength = 50*kPROPORTION;
    _infoImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_12.png"]];
    [headerView addSubview:_infoImgView];
    [_infoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImgView).with.offset(leftGap);
        make.centerY.equalTo(bgImgView);
        make.size.mas_equalTo(CGSizeMake(sideLength, sideLength));
    }];
    
    UIImageView *panaImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_14.png"]];
    [headerView addSubview:panaImgView];
    [panaImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView);
        make.bottom.equalTo(_infoImgView.mas_top).with.offset(4);
        make.centerX.equalTo(_infoImgView);
        make.width.mas_equalTo(sideLength);
    }];
    
    CGFloat lbHeight = 20*kPROPORTION;
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _nameLabel.text = self.appdelegate.personInfoModel.name;
    [self.view addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_infoImgView.mas_right).with.offset(leftGap/2);
        make.right.equalTo(bgImgView.mas_right);
        make.centerY.equalTo(bgImgView).with.offset(-lbHeight/2-3);
    }];
    
    _levelLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_levelLabel];
    _levelLabel.text = self.appdelegate.personInfoModel.identificationNumber;
    [_levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_infoImgView.mas_right).with.offset(leftGap/2);
        make.right.equalTo(bgImgView.mas_right);
        make.centerY.equalTo(bgImgView).with.offset(lbHeight/2+3);
    }];
    
    UIImageView *bottomImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PersonCenter_18.png"]];
    [self.view addSubview:bottomImgView];
    [bottomImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(headerView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.equalTo(bgImgView.mas_bottom).with.offset(5*kPROPORTION);
    }];
    
    LongButton *signInBtn = [LongButton buttonWithType:UIButtonTypeCustom title:@"退出登录" image:@"6.png" handler:^(UIButton *sender) {
        [self logOut];
    }];
    [self.view addSubview:signInBtn];
    [signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0,  30*kPROPORTION,20*kPROPORTION,  30*kPROPORTION));
        make.height.mas_equalTo(45*kPROPORTION);
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(headerHeight, 0, headerHeight, 0));
    }];
}

-(void)logOut{
    
    LoginViewController *vc =[ LoginViewController new];
    [self presentViewController:vc animated:YES
                     completion:nil];
    
}



-(void)returnButtonPressed{
    
    [self.sideMenuViewController presentLeftMenuViewController];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellstr = @"cellstr";
    PersonCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (cell==nil) {
        cell = [[PersonCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
    }
    NSDictionary *dict = _dataArray[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:dict[LABLE_ICON]];
    cell.txtLable.text = dict[LABLE_TEXT];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.row == 0) {
        PersonInfoViewController *vc =[PersonInfoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  60*kPROPORTION;
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
