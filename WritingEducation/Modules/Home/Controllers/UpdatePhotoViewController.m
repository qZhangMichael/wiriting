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
#import "BaseViewController+InputImageView.h"

#import "PhotoCollectionView.h"
#import "InputImageView.h"
#import "LongButton.h"

#import "SubmitWorksModel.h"

typedef NS_ENUM(NSInteger,InputClickType) {
    InputClickTypeReadWay,
    InputClickTypeSelectTeacher,
    InputClickTypeIsOpen,
    InputClickTypeMoney
};

@interface UpdatePhotoViewController ()<UITabBarDelegate,TZImagePickerControllerDelegate,PhotoCollectionViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)PhotoCollectionView *collectionView;

@property(nonatomic,strong)InputImageView *titleImgView;//作文标题
@property(nonatomic,strong)InputImageView *readWayView;//阅读方式
@property(nonatomic,strong)InputImageView *selectTeachrtView;//选择老师
@property(nonatomic,strong)InputImageView *isOpenView;//是否公开
@property(nonatomic,strong)InputImageView *moneyView;//金额

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
//    _selectTeachrtView.textField.text = @"zhangq94";
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
//    _moneyView.textField.keyboardType = UIKeyboardTypePhonePad;
    _moneyView.textField.delegate = self;
    _moneyView.textField.tag = InputClickTypeMoney;
//    _moneyView.textField.text = @"Sany";
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
    
    SubmitWorksModel *worksModel = [SubmitWorksModel new];
    worksModel.taskTitle = _titleImgView.textField.text;
    worksModel.sumitter = self.appdelegate.personInfoModel.phoneNumber;
    worksModel.evaluationStatus = @"0";
    worksModel.paymentStatus = @"0";
    worksModel.reviewTheWay = _readWayView.textField.text;
    worksModel.receiveTheFeeStaus = @"0";
    worksModel.phoneNumber = self.appdelegate.personInfoModel.phoneNumber;
    worksModel.title = _titleImgView.textField.text;
    worksModel.isItOpen = [_isOpenView.textField.text isEqualToString:@"是"]?@"1":@"0";
    worksModel.amount = _moneyView.textField.text.floatValue;
    
    NSDateFormatter *dateForm = [NSDateFormatter new];
    dateForm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *current = [dateForm stringFromDate:[NSDate date]];
     worksModel.creationTime = current;
     worksModel.submitTime = current;
    worksModel.timeOfOccurrence = current;
    
    TeacherMModel *teacherModel = (TeacherMModel *)_selectTeachrtView.attributes;
    worksModel.agentStaff = teacherModel.phoneNumber;
    
    NSDictionary *dict = [worksModel modelConvertDict];
    RequestHelp *requestHelp  = [RequestHelp new];
    NSMutableArray *mutArr = [NSMutableArray array];
    for (PhotoCollectionModel *photoModel in self.collectionView.dataArray ) {
        if (photoModel.photoType == PhotoTypeLocal) {
            [mutArr addObject:photoModel.thumbUIImage];
        }
    }
    
    [self showLoading];
    [requestHelp postUrl:URL_SUBMIT_WORKS parameters:dict WithUIImageArray:mutArr postImgBlock:^(id  _Nonnull responseObject) {
        [self hideLoading];
        RequestModel *reModel = [RequestModel yy_modelWithJSON:responseObject];
        [self showAlert:reModel.msg];
        if ([reModel verificationReturnParms]) {
            NSNumber *number = [NSNumber numberWithBool:YES];
            [KNotificationCenter postNotificationName:@"InfoNotification" object:number];
        }
        NSLog(@"%@",responseObject);
    } delegate:self];
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
        @WeakObj(self);
        TeacherListViewController *vc = [TeacherListViewController new];
        vc.teacherInfoBlock = ^(TeacherMModel *teacherModel) {
            @StrongObj(self);
            self.selectTeachrtView.textField.text = teacherModel.name;
            self.selectTeachrtView.attributes = teacherModel;
        };
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }else if(textField.tag == InputClickTypeIsOpen){
       [self toAlertSelect:textField titleArray:@[@"是",@"否"]];
        return NO;
    }else if(textField.tag == InputClickTypeMoney){
        [self toAlertSelect:textField titleArray:@[@"💲5",@"💲10",@"💲20"]];
        return NO;
    }
    return YES;
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
