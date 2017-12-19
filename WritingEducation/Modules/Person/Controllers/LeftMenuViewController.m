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

static NSString * LABLE_TEXT = @"text" ;
static NSString * LABLE_ICON = @"icon" ;

@interface LeftMenuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithData];
    [self initWithView];
}


-(void)initWithView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

-(void)initWithData{
    
    _dataArray = @[
                   @{LABLE_ICON:@"18.png",LABLE_TEXT:@"个人中心"},
                   @{LABLE_ICON:@"18.png",LABLE_TEXT:@"修改密码"},
                   @{LABLE_ICON:@"18.png",LABLE_TEXT:@"关于我们"},
                   @{LABLE_ICON:@"18.png",LABLE_TEXT:@"退出软件"}];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellStr = @"cellStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSDictionary *dict = _dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:LABLE_ICON];
    cell.textLabel.text = dict[LABLE_TEXT];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    LoginViewController *vc = [LoginViewController new];
    LoginViewController *vc = [[LoginViewController alloc]init];
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
