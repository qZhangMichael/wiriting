//
//  UpdatePhotoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/18.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "UpdatePhotoViewController.h"
#import "TZImagePickerController.h"
#import "TeacherListViewController.h"

#import "PhotoCollectionView.h"
#import "InputImageView.h"
#import "LongButton.h"

#import "SubmitWorksModel.h"

typedef NS_ENUM(NSInteger,InputClickType) {
    InputClickTypeReadWay,
    InputClickTypeSelectTeacher,
    InputClickTypeIsOpen
};

@interface UpdatePhotoViewController ()<UITabBarDelegate,TZImagePickerControllerDelegate,PhotoCollectionViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)PhotoCollectionView *collectionView;

@property(nonatomic,strong)InputImageView *titleImgView;//作文标题
@property(nonatomic,strong)InputImageView *readWayView;//阅读方式
@property(nonatomic,strong)InputImageView *selectTeachrtView;//选择老师
@property(nonatomic,strong)InputImageView *isOpenView;//是否公开
@property(nonatomic,strong)InputImageView *moneyView;//金额

@property(nonatomic,strong)SubmitWorksModel *worksModel;


@end

@implementation UpdatePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"111";
    self.view.backgroundColor = [UIColor clearColor];
    
    [self initWithView];

}

-(void)initWithView{
    
    CGFloat topGap = 8*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat height = 45*kPROPORTION;
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, height*2) backgroudImg:nil];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(self.view).with.offset(topGap);
        make.height.mas_equalTo(height*2);
    }];
    _collectionView.photoCollectionDelegate = self;
    
    _titleImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"wiritingUpload_18.png" contentImg:@""];
    _titleImgView.textField.placeholder = @"请输入作文标题";
    [self.view addSubview:_titleImgView];
    [_titleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_collectionView.mas_bottom).with.offset(topGap*2);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(height);
    }];
    
    _readWayView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"wiritingUpload_19.png" contentImg:@""];
    _readWayView.textField.placeholder = @"请输入评阅方式";
    _readWayView.textField.tag = InputClickTypeReadWay;
    _readWayView.textField.delegate = self;
    _readWayView.rightImgView.image = [UIImage imageNamed:@"wiritingUpload_right.png"];
    [self.view addSubview:_readWayView];
    [_readWayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_titleImgView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(height);
    }];
    
    _selectTeachrtView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"wiritingUpload_21.png" contentImg:@""];
    _selectTeachrtView.textField.placeholder = @"请选择老师";
    _selectTeachrtView.textField.tag = InputClickTypeSelectTeacher;
    _selectTeachrtView.rightImgView.image = [UIImage imageNamed:@"wiritingUpload_right.png"];
    _selectTeachrtView.textField.text = @"zhangq94";
    _selectTeachrtView.textField.delegate = self;
    [self.view addSubview:_selectTeachrtView];
    [_selectTeachrtView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_readWayView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(height);
    }];
    
    _isOpenView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"wiritingUpload_22.png" contentImg:@""];
    _isOpenView.textField.tag = InputClickTypeIsOpen;
    _isOpenView.textField.placeholder = @"是否公开";
    _isOpenView.textField.delegate = self;
    _isOpenView.rightImgView.image = [UIImage imageNamed:@"wiritingUpload_right.png"];
    _isOpenView.textField.text = @"2";
    [self.view addSubview:_isOpenView];
    [_isOpenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_selectTeachrtView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(height);
    }];
    
    _moneyView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"wiritingUpload_23.png" contentImg:@""];
    _moneyView.textField.placeholder = @"订单金额";
    _moneyView.textField.text = @"Sany";
    [self.view addSubview:_moneyView];
    [_moneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_isOpenView.mas_bottom).with.offset(topGap);
        make.left.equalTo(self.view).with.offset(aroundGap);
        make.right.equalTo(self.view).with.offset(-aroundGap);
        make.height.mas_equalTo(height);
    }];
    
    LongButton *loginBtn =[LongButton buttonWithType:UIButtonTypeCustom title:@"提 交" image:@"6.png" handler:^(UIButton *sender) {
        NSLog(@"提 交");
        [self submitWriting];
    }];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_moneyView);
        make.centerX.equalTo(self.view);
        make.top.equalTo(_moneyView.mas_bottom).with.offset(topGap);
    }];
}

-(void)submitWriting{
    
//    taskTitle
//    sumitter    15122223333
//    agentStaff    13787262394
//    submitTime    2018-01-25 20:32:30
//    evaluationStatus    0
//    paymentStatus    1
//    reviewTheWay    在线  ---->>>>
//    receiveTheFeeStaus    0
//    phoneNumber    15122223333
//    title
//    creationTime    2018-01-25 20:32:30
//    isItOpen    0
//    amount    250
//    timeOfOccurrence    2018-01-25 20:32:30  <<<<<------
  
    NSDateFormatter *dateForm = [NSDateFormatter new];
    dateForm.dateFormat = @"yyyy-MM-dd HH:mm:ss";

#warning 未写完 -- 教师选择信息返回，接口调试等 
    _worksModel.taskTitle = _titleImgView.textField.text;
    _worksModel.sumitter = self.appdelegate.personInfoModel.phoneNumber ;
//    model.agentStaff = _nameImgView.textField.text;
    _worksModel.submitTime = [dateForm stringFromDate:[NSDate date]];
    _worksModel.evaluationStatus = @"0";
    _worksModel.paymentStatus = @"0";
//    _worksModel.reviewTheWay =
//    model.registeredTime = [dateFor stringFromDate:[NSDate date]];
//    model.schoolName = _schoolImgView.textField.text;
//    model.jobTitle =  _technicalImgView.textField.text;
//    NSDictionary *dict = [model modelConvertDict];
//    RequestHelp *requestHelp  = [RequestHelp new];
//    NSMutableArray *mutArr = [NSMutableArray array];
//    for (PhotoCollectionModel *photoModel in self.collectionView.dataArray ) {
//        if (photoModel.photoType == PhotoTypeLocal) {
//            [mutArr addObject:photoModel.thumbUIImage];
//        }
//    }
//    [requestHelp postUrl:SIGN_TEACHER parameters:dict WithUIImageArray:mutArr postImgBlock:^(id  _Nonnull responseObject) {
//        [self hideLoading];
//        NSLog(@"%@",responseObject);
//    } delegate:self];
}

-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]initWithMaxImagesCount:3 delegate:self];
    PhotoCollectionModel *photoModel = self.collectionView.dataArray[indexPath.row];
    if (photoModel.photoType == PhotoTypeDefault) {
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            for (UIImage *img in photos) {
                PhotoCollectionModel *model =[PhotoCollectionModel new];
                model.photoType = PhotoTypeLocal;
                model.thumbUIImage = img;
                [self.collectionView.dataArray insertObject:model atIndex:0];
            }
            if (self.collectionView.dataArray.count>3) {
                [self.collectionView.dataArray removeLastObject];
            }
            [self.collectionView reloadData];
        }];
    }else if(photoModel.photoType == PhotoTypeLocal){
        imagePickerVc.maxImagesCount = 1;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            if (photos.count>0) {
                PhotoCollectionModel *model =[PhotoCollectionModel new];
                model.photoType = PhotoTypeLocal;
                model.thumbUIImage = photos.firstObject;
                [self.collectionView.dataArray replaceObjectAtIndex:indexPath.row withObject:model];
            }
            [self.collectionView reloadData];
        }];
    }
    [self presentViewController:imagePickerVc animated:YES completion:nil];

}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField.tag == InputClickTypeReadWay) {
        [self toAlertSelect:textField titleArray:@[@"在线",@"离线"]];
        return NO;
    }else if(textField.tag == InputClickTypeSelectTeacher){
        TeacherListViewController *vc = [TeacherListViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }else if(textField.tag == InputClickTypeIsOpen){
       [self toAlertSelect:textField titleArray:@[@"是",@"否"]];
        return NO;
    }
    return YES;
}

-(void)toAlertSelect:(UITextField *)textField titleArray:(NSArray <NSString*> *)titleArray{
    
    UIAlertController *alerVc = [UIAlertController alertControllerWithTitle:textField.placeholder message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *title in titleArray) {
        [alerVc addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            textField.text = action.title;
        }]];
    }
    [self presentViewController:alerVc animated:YES completion:nil];
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
