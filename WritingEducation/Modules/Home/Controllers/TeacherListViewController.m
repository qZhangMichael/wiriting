//
//  SelectTeacherViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/25.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "TeacherListViewController.h"
#import "TeacherListCell.h"
#import "TeacherResultListMModel.h"

@interface TeacherListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation TeacherListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"老师列表";
    [self initWithData];
    [self initWithView];
}

-(void)initWithView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

-(void)initWithData{
    
    [self requestData];
}

-(void)requestData{
    
    [self showLoading];
    RequestHelp *request = [RequestHelp new];
    TeacherResultListMModel *model = [TeacherResultListMModel new];
//    model.phoneNumber = self.appdelegate.personInfoModel.phoneNumber;
    NSString *str = [model yy_modelToJSONString];
    [request postUrl:TEACHER_LIST parameters:str postBlock:^(id  _Nonnull responseObject) {
        [self hideLoading];
        TeacherResultListMModel *responsemodel = [TeacherResultListMModel yy_modelWithJSON:responseObject];
        if ([responsemodel verificationReturnParms]&&responsemodel.teacherMList>0) {
            _dataArr = responsemodel.teacherMList;
            [self.tableView reloadData];
        }else{
            [self showAlert:[NSString stringWithFormat:@"%@%@",responsemodel.msg,responsemodel.flag]];
        }
    } delegate:self];
}


#pragma mark - uitabelviewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellStr = @"cellStr";
    TeacherListCell *cell  =[tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TeacherListCell" owner:nil options:nil]lastObject];
    }
    TeacherMModel *model = _dataArr[indexPath.row];
    cell.teacherNameLb.text = model.name;
    cell.teacherLevelLb.text = [NSString stringWithFormat:@"教师等级:%@",model.jobTitle];
    cell.priceLb.text = [NSString stringWithFormat:@"价格:%ld",model.teacherPrice.price];
    cell.timesLb.text = [NSString stringWithFormat:@"评阅次数:(字段缺失)"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
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
