//
//  SignInViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/12.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "SignInViewController.h"
#import "InputImageView.h"
#import "LongButton.h"
#import "SignStudentModel.h"
#import "RequestHelp.h"
#import "PhotoCollectionView.h"
#import "SignTeacherModel.h"
#import "TZImagePickerController.h"

@interface SignInViewController ()<PhotoCollectionViewDelegate,TZImagePickerControllerDelegate>

@property(nonatomic,strong)UIButton *studentBtn;
@property(nonatomic,strong)UIButton *teacherBtn;
@property(nonatomic,strong)InputImageView *nameImgView;
@property(nonatomic,strong)InputImageView *phoneImgView;
@property(nonatomic,strong)InputImageView *passImgView;
@property(nonatomic,strong)InputImageView *levelImgView;
@property(nonatomic,strong)InputImageView *schoolImgView;
@property(nonatomic,strong)InputImageView *technicalImgView;

@property(nonatomic,strong)UIButton *selectProtocolBtn;

@property(nonatomic,strong)PhotoCollectionView *collectionView;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    [self initWithView];
}

-(void)initWithView{
    
    CGFloat topGap = 8*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    CGFloat  gap = 4*kPROPORTION;
    
    _studentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_studentBtn setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateSelected];
    [_studentBtn setImage:[UIImage imageNamed:@"14.png"] forState:UIControlStateNormal];
    _studentBtn.tag = 111;
    [_studentBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_studentBtn];
    _studentBtn.selected = YES;
    [_studentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap*2);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.width.mas_equalTo((SCREEN_WIDTH-aroundGap*3)/2);
        make.height.mas_equalTo(Height);
    }];
    
    _teacherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_teacherBtn setImage:[UIImage imageNamed:@"13.png"] forState:UIControlStateSelected];
    [_teacherBtn setImage:[UIImage imageNamed:@"9.png"] forState:UIControlStateNormal];
    [_teacherBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    _teacherBtn.tag = 222;
    [self.view addSubview:_teacherBtn];
    [_teacherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(topGap*2);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.width.mas_equalTo((SCREEN_WIDTH-aroundGap*2-10*kPROPORTION)/2);
        make.height.mas_equalTo(Height);
    }];
    
    _nameImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"3.png"];
    _nameImgView.textField.placeholder = @"请输入学生姓名";
    _nameImgView.textField.text = @"zhangq94";
    [self.view addSubview:_nameImgView];
    [_nameImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_studentBtn.mas_bottom).with.offset(topGap*2);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _phoneImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"5.png" contentImg:@"15.png"];
    _phoneImgView.textField.placeholder = @"请输入手机号码";
    _phoneImgView.textField.text = @"18100680066";
    _phoneImgView.textField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:_phoneImgView];
    [_phoneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_nameImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _passImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"10.png" contentImg:@"4.png"];
    _passImgView.textField.placeholder = @"请输入登录密码";
    _passImgView.textField.text = @"zhangq94";
    [self.view addSubview:_passImgView];
    [_passImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_phoneImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _levelImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"11.png" contentImg:@"16.png"];
    _levelImgView.textField.placeholder = @"请输入学生年级";
    _levelImgView.textField.text = @"2";
    [self.view addSubview:_levelImgView];
    [_levelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_passImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _schoolImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"17.png"];
    _schoolImgView.textField.placeholder = @"请输入学生学校名称";
    _schoolImgView.textField.text = @"Sany";
    [self.view addSubview:_schoolImgView];
    [_schoolImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_levelImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];
    
    _technicalImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"10.png" contentImg:@"19.png"];
    _technicalImgView.textField.placeholder = @"请输入您的职称";
    _technicalImgView.textField.text = @"高中老师";
    [self.view addSubview:_technicalImgView];
    [_technicalImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_schoolImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(Height);
    }];

    _selectProtocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectProtocolBtn setImage:[UIImage imageNamed:@"12.png"] forState:UIControlStateNormal];
    [_selectProtocolBtn setImage:[UIImage imageNamed:@"18.png"] forState:UIControlStateSelected];
    [_selectProtocolBtn addTarget:self action:@selector(selectProtocolClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_selectProtocolBtn];
    [_selectProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_technicalImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.size.mas_equalTo(CGSizeMake(Height, Height));
    }];
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, Height*2) dataArray:nil];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_selectProtocolBtn.mas_bottom).with.offset(topGap);
        make.height.mas_equalTo(Height*2);
    }];
    _collectionView.photoCollectionDelegate = self;
    
    UIButton *protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    protocolBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [protocolBtn setTitle:@"是否同意XXX协议" forState:UIControlStateNormal];
    [protocolBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [protocolBtn addTarget:self action:@selector(protocolBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:protocolBtn];
    [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_selectProtocolBtn);
        make.left.equalTo(_selectProtocolBtn.mas_right).with.offset(gap);
        make.height.mas_equalTo(Height);
        make.right.equalTo(self.view).with.offset(-aroundGap);
    }];
    
    LongButton *signInBtn = [LongButton buttonWithType:UIButtonTypeCustom title:@"注  册" image:@"6.png" handler:^(UIButton *sender) {
        NSLog(@"注  册");
        [self signBtnClick];
    }];
    [self.view addSubview:signInBtn];
    [signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, topGap*2, aroundGap));
        make.height.mas_equalTo(Height);
    }];
    
    [self switchSignPerson:YES];
}

-(void)selectType:(id)action{
    
    UIButton *btn = (UIButton*)action;
    if (btn.tag ==111) {
        _studentBtn.selected = YES;
        _teacherBtn.selected = NO;
        [self switchSignPerson:YES];
    }else{
        _studentBtn.selected = NO;
        _teacherBtn.selected = YES;
        [self switchSignPerson:NO];
        
    }
}

-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]initWithMaxImagesCount:3 delegate:self];
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self.collectionView.dataArray =  [photos mutableCopy];
        [self.collectionView reloadData];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];

}

-(void)switchSignPerson:(BOOL)isStudent{
    
    CGFloat Height = isStudent?0:45*kPROPORTION;
    [_technicalImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(Height);
    }];
    _technicalImgView.hidden = isStudent;
    _collectionView.hidden = isStudent;
    _levelImgView.textField.text = isStudent?@"2":@"430902111114143333";
}


-(void)selectProtocolClick:(id)action{
    
    UIButton *btn = (UIButton*)action;
    btn.selected = !btn.selected;
}

-(void)protocolBtnClick:(id)action{
    
}

-(void)signBtnClick{
    
    [self showLoading];
    NSDateFormatter *dateFor = [NSDateFormatter new];
    dateFor.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *requestStr;
    if(_studentBtn.selected){
        SignStudentModel*model = [SignStudentModel new];
        model.accountType = @"student";
        //   model.age =11;
        //    model.gradeCode=2;
        model.gradeDesc= _levelImgView.textField.text ;
        model.name = _nameImgView.textField.text;
        model.password = _passImgView.textField.text;
        model.phoneNumber = _phoneImgView.textField.text;
        model.registeredTime = [dateFor stringFromDate:[NSDate date]];
        model.schoolName = _schoolImgView.textField.text;
        requestStr = [model yy_modelToJSONString];
        [self requestData:requestStr WithURL:SIGN_STUDENT];
    }else{
        SignTeacherModel*model = [SignTeacherModel new];
        model.accountType = @"teacher";
        //   model.age =11;
        //    model.gradeCode=2;
        model.identificationNumber= _levelImgView.textField.text ;
        model.name = _nameImgView.textField.text;
        model.password = _passImgView.textField.text;
        model.phoneNumber = _phoneImgView.textField.text;
        model.registeredTime = [dateFor stringFromDate:[NSDate date]];
        model.schoolName = _schoolImgView.textField.text;
        model.jobTitle =  _technicalImgView.textField.text;
        requestStr = [model yy_modelToJSONString];
        [self requestData:requestStr WithURL:SIGN_TEACHER];
    }
    
}

-(void)requestData:(NSString *)requestStr WithURL:(NSString*)urlStr{
    
    RequestHelp *requestHelp = [RequestHelp new];
    [requestHelp postUrl:urlStr parameters:requestStr postBlock:^(id  _Nonnull responseObject) {
        [self hideLoading];
        NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"1111111%@",str);
        SignStudentModel *model = [SignStudentModel yy_modelWithJSON:responseObject];
        [self showAlert:model.msg];
    } delegate:self];
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

