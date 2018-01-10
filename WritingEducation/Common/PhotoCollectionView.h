//
//  PhotoCoollectionView.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/3.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoCollectionViewDelegate <NSObject>

-(void)didClickCollectionItem:(NSIndexPath *)indexPath;

@end
@interface PhotoCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,weak)id<PhotoCollectionViewDelegate>photoCollectionDelegate;
-(instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;


@end
