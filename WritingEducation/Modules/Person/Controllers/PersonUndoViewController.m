//
//  PerosnUndoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/14.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PersonUndoViewController.h"
#import "BaseNavigationViewController.h"
#import "TeacherProductDetailViewController.h"
//model
#import "AgentMListModel.h"
//view
#import "PersonUndoCell.h"
#import "MyProductListCell.h"
#import "NSString+Help.h"

@interface PersonUndoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIButton *undoBtn;
@property(nonatomic,strong)UIButton *readedBtn;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)AgentMListModel *agentModel;
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation PersonUndoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"待办已阅";
    [self initWithData];
    [self initWithView];
    [self requestData];
}

-(void)initWithData{
    
//    _dataArr = [NSMutableArray array];
//    _dataArr = @[@"",@"",@"",@""];
}

-(void)initWithView{
    
    CGFloat topGap = 16*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"photo-1.png"] forState:UIControlStateNormal ];
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    _undoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_undoBtn setImage:[UIImage imageNamed:@"undo_select.png"] forState:UIControlStateSelected];
    [_undoBtn setImage:[UIImage imageNamed:@"undo_normal.png"] forState:UIControlStateNormal];
    _undoBtn.tag = PersonUndoTypeUndone;
    [_undoBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_undoBtn];
    _undoBtn.selected = YES;
    [_undoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.width.mas_equalTo((SCREEN_WIDTH-aroundGap*3)/2);
        make.height.mas_equalTo(Height);
    }];
    
    _readedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_readedBtn setImage:[UIImage imageNamed:@"readed_select.png"] forState:UIControlStateSelected];
    [_readedBtn setImage:[UIImage imageNamed:@"readed_normal.png"] forState:UIControlStateNormal];
    [_readedBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    _readedBtn.tag = 222;
    [self.view addSubview:_readedBtn];
    [_readedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.width.mas_equalTo((SCREEN_WIDTH-aroundGap*2-10*kPROPORTION)/2);
        make.height.mas_equalTo(Height);
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_undoBtn.mas_bottom).with.offset(topGap);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-topGap);
    }];
}

-(void)requestData{
    
    RequestHelp *request = [RequestHelp new];
    AgentMListModel *model = [AgentMListModel new];
    model.agentStaff = GlobalUserInfo.phoneNumber;
    model.evaluationStatus =_undoBtn.selected?@"0":@"1";
    NSString *str = [model yy_modelToJSONString];
    [self showLoading];
    [request postUrl:URL_Agent_LIST parameters:str postBlock:^(id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        [self hideLoading];
        self.agentModel = [AgentMListModel yy_modelWithJSON:responseObject];
        if ([self.agentModel verificationReturnParms]) {
            self.dataArr = self.agentModel.agentMList;
            [self.tableView reloadData];
        }else{
            [self showAlert:self.agentModel.msg];
        }
    } delegate:self];
}

-(void)selectType:(id)action{
    
    UIButton *btn = (UIButton*)action;
    if (btn.tag == PersonUndoTypeUndone) {
        _undoBtn.selected = YES;
        _readedBtn.selected = NO;
    }else{
        _undoBtn.selected = NO;
        _readedBtn.selected = YES;
    }
    [self requestData];
}

-(void)leftBtnClick:(id)action{
    
    [self.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark ====== uitableviewdelegate =========
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        AgentMModel *model = _dataArr[indexPath.row];
    if (_undoBtn.selected) {
        static NSString *cellStr = @"PersonUndoCell";
        PersonUndoCell *cell  =[tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonUndoCell" owner:nil options:nil]firstObject];
        }
        cell.titleLb.text = [NSString stringWithFormat:@"标题:%@",model.taskTitle];
        cell.nameLb.text = [NSString stringWithFormat:@"姓名:%@",model.student.name];
        return cell;
    }else{
        static NSString *cellStr = @"MyProductListCell";
        MyProductListCell *cell  =[tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MyProductListCell" owner:nil options:nil]lastObject];
        }
        cell.writingTitleLb.text = model.taskTitle;
        ChangeTheResultModel *changgeModel = model.changeTheResult.firstObject;
        cell.scoreLb.text = [NSString stringWithFormat:@"分数:%@",changgeModel.worksScore];
        cell.teacherNameLb.text = [NSString stringWithFormat:@"点评学生:%@",model.student.name];
        cell.statusLb.text = [NSString stringWithFormat:@"点评状态:%@",[model.evaluationStatus isEqualZero]?@"待评价":@"评价完成"] ;
        cell.priceLb.text = [NSString stringWithFormat:@"价格:%@",model.costInfo.amount];
        return cell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _undoBtn.selected?80:120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TeacherProductDetailViewController *vc = [TeacherProductDetailViewController new];
    vc.agentMModel = _dataArr[indexPath.row];
    vc.teacherProductType = _undoBtn.selected?TeacherProductDetailTypeUndo:TeacherProductDetailTypeReaded;
    [self.navigationController pushViewController:vc animated:YES];
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
