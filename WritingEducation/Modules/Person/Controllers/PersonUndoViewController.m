//
//  PerosnUndoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/14.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PersonUndoViewController.h"

@interface PersonUndoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIButton *undoBtn;
@property(nonatomic,strong)UIButton *readedBtn;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation PersonUndoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithData];
    [self initWithView];
}

-(void)initWithData{
    
    _dataArr = [NSMutableArray array];
    
}

-(void)initWithView{
    
    CGFloat topGap = 16*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    
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
    
//    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
//    _tableView.delegate =self;
//    _tableView.dataSource = self;
//    [self.view addSubview:_tableView];
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).with.offset(topGap);
//        make.right.equalTo(self.view).with.offset(-aroundGap);
//        make.left.equalTo(self.view).with.offset(aroundGap);
//        make.bottom.equalTo(self.view).with.offset(-topGap);
//    }];
}

-(void)selectType:(id)action{
    
    UIButton *btn = (UIButton*)action;
    if (btn.tag ==PersonUndoTypeUndone) {
        _undoBtn.selected = YES;
        _readedBtn.selected = NO;
//        [self switchSignPerson:YES];
    }else{
        _undoBtn.selected = NO;
        _readedBtn.selected = YES;
//        [self switchSignPerson:NO];
    }
}

#pragma mark ====== uitableviewdelegate =========
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return _dataArr.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
////
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:]
//}


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
