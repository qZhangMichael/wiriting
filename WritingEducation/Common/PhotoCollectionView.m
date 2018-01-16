//
//  PhotoCoollectionView.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/3.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RequestUrl.h"


static NSString * identify = @"cell";
NSString *const defaultImg = @"bg_register_certificate.png";

@implementation PhotoCollectionView

-(instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if ([super initWithFrame:frame collectionViewLayout:flowLayout]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.scrollEnabled = YES;
        self.dataSource = self;
        self.delegate =self;
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:identify];
        _dataArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark  设置CollectionView的组数
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return _dataArray.count;
//}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    PhotoCollectionModel *model = _dataArray[indexPath.row];
    if (model.photoType == PhotoTypeWeb) {
//        NSString *url = [NSString stringWithFormat:@"%@%@",HEADER_URI,model.thumbURL];
//        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:url]
//                        placeholderImage:nil];
        [SDWebImageDownloader.sharedDownloader setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
        
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:@"http://47.104.136.6/soundapp/images/13787262399/approved/20180116172637/magazine-unlock-03-2.3.858-_8f339702240e4afca8056ace33b8761b.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            NSLog(@"%@",error);
        }];
    }else if (model.photoType == PhotoTypeLocal){
        cell.imgView.image = model.thumbUIImage;
    }else {
//       cell.imgView.image = [UIImage imageNamed:@"defaultImg"];
    }
  
    return cell;
}



#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return  CGSizeMake(self.frame.size.height,self.frame.size.height);
}



#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0,0,0,0);//（上、左、下、右）
}

#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    Medal *p = self.medals[indexPath.item];
    NSLog(@"---------------------");
    if ([self.photoCollectionDelegate respondsToSelector:@selector(didClickCollectionItem:)]) {
        [self.photoCollectionDelegate performSelector:@selector(didClickCollectionItem:) withObject:indexPath];
    }
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
