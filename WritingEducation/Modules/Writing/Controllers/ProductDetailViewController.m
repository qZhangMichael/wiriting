//
//  ProductDetailViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/17.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "TextImageView.h"
#import "PhotoCollectionView.h"
#import "LongButton.h"
#import "UITextView+Help.h"

@interface ProductDetailViewController ()<PhotoCollectionViewDelegate>

@property(nonatomic,strong)TextImageView *scoreTextImg;
@property(nonatomic,strong)TextImageView *teacherCommentTextImg;
@property(nonatomic,strong)TextImageView *studentCommentTextImg;
@property(nonatomic,strong)PhotoCollectionView *collectionView;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initWithView];
    [self initWithData];
    self.title = _productModel.taskTitle;
}


-(void)initWithData{
    
    for (MyWorks_WorksListModel *model in _productModel.worksList) {
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
    
     NSString *scoreStr = [NSString stringWithFormat: @"%ld", (long)_productModel.changeTheResult.worksScore];
    _scoreTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"ProductDetail_1.png" content:scoreStr edg:UIEdgeInsetsMake(44, 20, 36, 40)];
    _scoreTextImg.contentText.font = [UIFont systemFontOfSize:20.f];
    _scoreTextImg.contentText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_scoreTextImg];
    [_scoreTextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(updownGap);
        make.size.mas_equalTo(CGSizeMake(100, 120));
    }];
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, height*2) backgroudImg:@"ProductDetail_2.png"];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.top.mas_equalTo(_scoreTextImg.mas_bottom).with.offset(updownGap);
        make.height.mas_equalTo(height*2);
    }];
    _collectionView.photoCollectionDelegate = self;
    
    _teacherCommentTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"ProductDetail_6.png" content:_productModel.changeTheResult.workEvaluation edg:UIEdgeInsetsMake(20, 20, 25, 25)];
    _teacherCommentTextImg.contentText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_teacherCommentTextImg];
    [_teacherCommentTextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.mas_bottom).with.offset(updownGap);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(height*3);
    }];
    
    UIImageView*studentsInfoImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ProductDetail_3.png"]];
    [self.view addSubview:studentsInfoImgView];
    [studentsInfoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_teacherCommentTextImg.mas_bottom).with.offset(updownGap);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap*2, 0, aroundGap*2));
        make.height.mas_equalTo(30);
    }];
    
    UILabel *studentLb = [[UILabel alloc]init];
    studentLb.backgroundColor = [UIColor clearColor];
    studentLb.textAlignment = NSTextAlignmentCenter;
    [studentsInfoImgView addSubview:studentLb];
    studentLb.text = @"学生评价";
    [studentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(studentsInfoImgView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    _studentCommentTextImg = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"ProductDetail_6.png" content:@"" edg:UIEdgeInsetsMake(20, 20, 25, 25)];
    _studentCommentTextImg.contentText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_studentCommentTextImg];
    [_studentCommentTextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(studentsInfoImgView.mas_bottom).with.offset(updownGap);
        make.left.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, aroundGap, 0, aroundGap));
        make.height.mas_equalTo(height*3);
    }];
    
}

-(void)didClickCollectionItem:(NSIndexPath *)indexPath{
    
    
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
