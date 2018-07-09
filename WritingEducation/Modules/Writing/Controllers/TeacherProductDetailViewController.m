//
//  TeacherProductDetailViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "TeacherProductDetailViewController.h"
#import "PhotoCollectionView.h"
#import "PhotoViewController.h"
#import "ReadPhotoViewController.h"
#import "TextImageView.h"
#import "LongButton.h"

#import "ApprovedWorksRfcModel.h"

@interface TeacherProductDetailViewController ()<PhotoCollectionViewDelegate>

@property(nonatomic,strong)PhotoCollectionView *collectionView;
@property(nonatomic,strong)TextImageView *teacherCommentTextImg;
@property(nonatomic,strong)TextImageView *scoreTextImg;

@property(nonatomic,strong)PhotoCollectionModel *selectModel;

@end

@implementation TeacherProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.agentMModel.taskTitle;
    // Do any additional setup after loading the view.
    [self initWithView];
    [self initWithData];
}

-(void)initWithData{
    
    for (WorksModel *model in _agentMModel.worksList) {
        PhotoCollectionModel *photoModel = [PhotoCollectionModel new];
        photoModel.photoType = PhotoTypeWeb;
        photoModel.originalURL = model.imageContentPath;
        photoModel.thumbURL = model.imageContentPath;
        [self.collectionView.dataArray insertObject:photoModel atIndex:0];
    }
//    if (self.collectionView.dataArray.count>3) {
        [self.collectionView.dataArray removeLastObject];
//    }
}

-(void)initWithView{
    
    CGFloat updownGap = 10;
    CGFloat aroundGap = 30;
    CGFloat height = 45*kPROPORTION;
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, height*2) backgroudImg:@"ProductDetail_2.png"];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(self.view).with.offset(updownGap);
        make.height.mas_equalTo(height*2);
    }];
    _collectionView.photoCollectionDelegate = self;
    
    _teacherCommentTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"ProductDetail_6.png" content:@"" edg:UIEdgeInsetsMake(20, 20, 25, 25)];
     _teacherCommentTextImg.contentText.placeholder = @"老师评论";
    _teacherCommentTextImg.contentText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_teacherCommentTextImg];
    [_teacherCommentTextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.mas_bottom).with.offset(updownGap);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(height*3);
    }];
    
    _scoreTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"list.png" content:@"" edg:UIEdgeInsetsMake(4, 0, 0, 0)];
    _scoreTextImg.contentText.textAlignment = NSTextAlignmentCenter;
    _scoreTextImg.contentText.font = [UIFont systemFontOfSize:18];
    _scoreTextImg.contentText.keyboardType = UIKeyboardTypeNumberPad;
    _scoreTextImg.contentText.placeholder = @"请输入文章分数0～100";
    [self.view addSubview:_scoreTextImg];
    [_scoreTextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_teacherCommentTextImg.mas_bottom).with.offset(updownGap);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(@(height));
    }];
    
    LongButton *submitBtn =[LongButton buttonWithType:UIButtonTypeCustom title:@"提 交 " image:@"6.png" handler:^(UIButton *sender) {
        [self clickSubmit:sender];
    }];
    [self.view addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_scoreTextImg);
        make.centerX.equalTo(self.view);
        make.top.equalTo(_scoreTextImg.mas_bottom).with.offset(updownGap);
    }];
    
    if (self.teacherProductType == TeacherProductDetailTypeReaded) {
        
        _teacherCommentTextImg.contentText.userInteractionEnabled = NO;
        ChangeTheResultModel *changgeModel = self.agentMModel.changeTheResult.firstObject;
        _teacherCommentTextImg.contentText.text = changgeModel.workEvaluation ;
        _scoreTextImg.contentText.userInteractionEnabled = NO;
        _scoreTextImg.contentText.text = changgeModel.worksScore.stringValue;
    
        submitBtn.hidden = YES;
        
    }
}

-(void)clickSubmit:(id)sender{
    
    ApprovedWorksRfcModel *worksModel = [ApprovedWorksRfcModel new];
    worksModel.agentListUuid = _agentMModel.worksList.firstObject.agentListUuid;
    worksModel.worksScore = _scoreTextImg.contentText.text;
    worksModel.workEvaluation = _teacherCommentTextImg.contentText.text;
    worksModel.dealer = GlobalUserInfo.phoneNumber;
    
    NSDateFormatter *dateForm = [NSDateFormatter new];
    dateForm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *current = [dateForm stringFromDate:[NSDate date]];
    worksModel.dealTime = current;
    
    NSDictionary *dict = [worksModel modelConvertDict];
    RequestHelp *requestHelp  = [RequestHelp new];
    NSMutableArray *mutArr = [NSMutableArray array];
    for (PhotoCollectionModel *photoModel in self.collectionView.dataArray ) {
        if (photoModel.photoType == PhotoTypeWeb) {
            [mutArr addObject:photoModel.thumbURLImage];
        }
    }
    
    [self showLoading];
    [requestHelp postUrl:URL_APPROVED_WORKS  parameters:dict WithUIImageArray:mutArr postImgBlock:^(id  _Nonnull responseObject) {
        [self hideLoading];
        RequestModel *reModel = [RequestModel yy_modelWithJSON:responseObject];
        [self showAlert:reModel.msg];
        if ([reModel verificationReturnParms]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        NSLog(@"%@",responseObject);
    } delegate:self];
    
}

-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
    _selectModel = self.collectionView.dataArray[indexPath.row];
    if (_teacherProductType == TeacherProductDetailTypeReaded) {
        ReadPhotoViewController * vc = [[ReadPhotoViewController alloc]init:_selectModel.thumbURLImage];
        [self presentViewController:vc animated:YES completion:nil];
    }else{
        PhotoViewController * vc = [[PhotoViewController alloc]initWithBackImg:_selectModel.thumbURLImage Edtior:YES editorImg:^(UIImage *img) {
            _selectModel.thumbURLImage = img;
        }];
        [self presentViewController:vc animated:YES completion:nil];
    }
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
