//
//  MyProductListViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/18.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "MyProductListViewController.h"
#import "ProductDetailViewController.h"
#import "MyProductListCell.h"
#import "MyWorksListModel.h"

@interface MyProductListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)MyWorksListModel *work_Model;

@end

@implementation MyProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"作品列表";
    self.view.backgroundColor = [UIColor clearColor];
    [self initWithData];
    [self initWithView];
   
}

-(void)viewDidAppear:(BOOL)animated{
    
     [self requestData];
}

-(void)initWithData{
    
    _dataArr = [NSMutableArray array];
}

-(void)initWithView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

-(void)requestData{
    
    [self showLoading];
    RequestHelp *requestHelp = [RequestHelp new];
    NSString *str = [NSString stringWithFormat:MYWORKS_LIST,self.appdelegate.personInfoModel.phoneNumber];
    [requestHelp getUrl:str parameters:nil getBlock:^(id  _Nonnull responseObject) {
        [self hideLoading];
         self.work_Model  = [MyWorksListModel yy_modelWithJSON:responseObject];
        if ([self.work_Model verificationReturnParms]) {
            _dataArr =  [self.work_Model.myWorksMList mutableCopy];
            [self.tableView reloadData];
        }
    } delegate:self];
}

#pragma mark  ====== UITableViewDelegate =========
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellStr = @"cellStr";
    MyProductListCell *cell  =[tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyProductListCell" owner:nil options:nil]lastObject];
    }
    MyWorks_MyWorksListModel *model = _dataArr[indexPath.row];
    cell.writingTitleLb.text = model.taskTitle;
    cell.scoreLb.text = [NSString stringWithFormat:@"分数:%ld",model.changeTheResult.worksScore];
    cell.teacherNameLb.text = [NSString stringWithFormat:@"点评老师:%@",model.teacher.name];
    cell.statusLb.text = [NSString stringWithFormat:@"点评状态:%@",model.evaluationStatus] ;
    cell.priceLb.text = [NSString stringWithFormat:@"价格:%ld",model.costInfo.amount];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyWorks_MyWorksListModel *model = _dataArr[indexPath.row];
    ProductDetailViewController *vc = [ProductDetailViewController new];
    vc.productModel = model;
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
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
