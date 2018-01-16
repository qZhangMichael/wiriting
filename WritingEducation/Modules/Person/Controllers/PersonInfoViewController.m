//  PersonInfoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/2.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "InputImageView.h"
#import "PhotoCollectionView.h"
#import "TZImagePickerController.h"
#import "TeacherResultListMModel.h"

@interface PersonInfoViewController ()<PhotoCollectionViewDelegate,TZImagePickerControllerDelegate>

@property(nonatomic,strong)InputImageView *phoneImgView;
@property(nonatomic,strong)InputImageView *cardImgView;
@property(nonatomic,strong)InputImageView *schoolImgView;
@property(nonatomic,strong)InputImageView *levelImgView;

@property(nonatomic,strong)PhotoCollectionView *collectionView;

@property(nonatomic,strong)TeacherMModel *teacherMModel;


@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"基本信息";
    [self initWithView];
    [self requestData];
   
}

-(void)initWithView{
    
    CGFloat topGap = 30*kPROPORTION;
    CGFloat aroundGap = 30*kPROPORTION;
    CGFloat Height = 45*kPROPORTION;
    
    _phoneImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"2.png" contentImg:@"15.png"];
    _phoneImgView.textField.placeholder = @"请输入手机号码";
    _phoneImgView.textField.text = self.appdelegate.personInfoModel.phoneNumber;
    [self.view addSubview:_phoneImgView];
    [_phoneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(topGap, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(Height);
    }];
    
    _cardImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"5.png"  contentImg:@"16.png"];
    _cardImgView.textField.placeholder = @"XXXXXXXXXXXXXXXXXXX";
    _cardImgView.textField.text = self.appdelegate.personInfoModel.identificationNumber;
    [self.view addSubview:_cardImgView];
    [_cardImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_phoneImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height);
    }];
    
    _schoolImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"11.png"  contentImg:@"17.png"];
    _schoolImgView.textField.placeholder = @"XX学校";
    _schoolImgView.textField.text = self.appdelegate.personInfoModel.schoolName;
    [self.view addSubview:_schoolImgView];
    [_schoolImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_cardImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height);
    }];
    
    _levelImgView = [[InputImageView alloc]initWithFrame:CGRectZero backImg:@"10.png"  contentImg:@"19.png"];
    _levelImgView.textField.placeholder = @"金牌老师";
    _levelImgView.textField.text = self.appdelegate.personInfoModel.jobTitle;
    [self.view addSubview:_levelImgView];
    [_levelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_schoolImgView.mas_bottom).with.offset(topGap/3);
        make.height.mas_equalTo(Height);
    }];
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, Height*2) dataArray:nil];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_levelImgView.mas_bottom).with.offset(topGap);
        make.height.mas_equalTo(Height*2);
    }];
    _collectionView.photoCollectionDelegate = self;

}

-(void)requestData{
    
    [self showLoading];
    RequestHelp *request = [RequestHelp new];
    TeacherResultListMModel *model = [TeacherResultListMModel new];
    model.phoneNumber = self.appdelegate.personInfoModel.phoneNumber;
    NSString * str = [model yy_modelToJSONString];
    [request postUrl:TEACHER_LIST parameters:str postBlock:^(id  _Nonnull responseObject) {
            [self hideLoading];
            TeacherResultListMModel *responsemodel = [TeacherResultListMModel yy_modelWithJSON:responseObject];
        if ([responsemodel verificationReturnParms]&&responsemodel.teacherMList>0) {
            self.teacherMModel = responsemodel.teacherMList.firstObject;
            [self fillData];
        }else{
            [self showAlert:[NSString stringWithFormat:@"%@%@",responsemodel.msg,responsemodel.flag]];
        }
    } delegate:self];
}


-(void)fillData{
    
    for (QualificationCertificateModel *model in self.teacherMModel.qualificationCertificateList) {
        PhotoCollectionModel *photoModel  = [PhotoCollectionModel new];
        photoModel.photoType = PhotoTypeWeb;
        photoModel.originalURL = model.certificatePathDownload;
        photoModel.thumbURL = model.certificatePathView;
        [self.collectionView.dataArray addObject:photoModel];
    }
    [self.collectionView reloadData];
}



-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]initWithMaxImagesCount:3 delegate:self];
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        for (UIImage *img in photos) {
            PhotoCollectionModel *model = [PhotoCollectionModel new];
            model.photoType = PhotoTypeLocal;
            model.thumbUIImage = img;
            [self.collectionView.dataArray addObject:model];
        }
        [self.collectionView reloadData];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
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
