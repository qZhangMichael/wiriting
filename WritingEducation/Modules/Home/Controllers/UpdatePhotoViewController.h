//
//  UpdatePhotoViewController.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/18.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^UpdatePhotoBlock)(BOOL isUpdate);

@interface UpdatePhotoViewController : BaseViewController

@property(nonatomic,copy)UpdatePhotoBlock updatePhotoBlock;

@end
