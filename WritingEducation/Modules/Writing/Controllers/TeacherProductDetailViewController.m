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

@interface TeacherProductDetailViewController ()<PhotoCollectionViewDelegate>

@property(nonatomic,strong)PhotoCollectionView *collectionView;
@property(nonatomic,strong)TextImageView *teacherCommentTextImg;
@property(nonatomic,strong)TextImageView *scoreTextImg;

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
    if (self.collectionView.dataArray.count>3) {
        [self.collectionView.dataArray removeLastObject];
    }
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
    
    _teacherCommentTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"ProductDetail_6.png" content:@"11" edg:UIEdgeInsetsMake(20, 20, 25, 25)];
//    @"_productModel.changeTheResult.workEvaluation"
    _teacherCommentTextImg.contentText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_teacherCommentTextImg];
    [_teacherCommentTextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.mas_bottom).with.offset(updownGap);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(height*3);
    }];
    
    _scoreTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"list.png" content:@"" edg:UIEdgeInsetsMake(0, 0, 0, 0)];
    _scoreTextImg.contentText.textAlignment = NSTextAlignmentCenter;
    _scoreTextImg.contentText.font = [UIFont systemFontOfSize:18];
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
    
    
    
}

-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
    PhotoCollectionModel *model = self.collectionView.dataArray[indexPath.row];
//    PhotoViewController * vc = [[PhotoViewController alloc]initWithBackImg:model.thumbURLImage Edtior:YES];
    ReadPhotoViewController* vc = [[ReadPhotoViewController alloc]init:model.thumbURLImage];
    [self.navigationController pushViewController:vc animated:YES];

//    [self presentViewController:vc animated:YES completion:nil];
    
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
