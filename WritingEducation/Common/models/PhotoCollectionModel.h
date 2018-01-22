//
//  PhotoCollectionModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseModel.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PhotoType){
    PhotoTypeDefault,//默认没有选照片十几
    PhotoTypeLocal, //照相机选择
    PhotoTypeWeb //网上下载同步照片
};

@interface PhotoCollectionModel : BaseModel

@property(nonatomic,assign)PhotoType photoType;

//PhotoTypeDefault
@property(nonatomic,strong)NSString *backgroudImg;

//PhotoTypeLocal
@property(nonatomic,strong)UIImage *thumbUIImage;
//@property(nonatomic,strong)NSString *originalUIImage;

//PhotoTypeWeb
@property(nonatomic,strong)NSString *originalURL;
@property(nonatomic,strong)NSString *thumbURL;


@end
