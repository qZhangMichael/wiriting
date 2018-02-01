//
//  ViewController.h
//  HBDrawViewDemo
//
//  Created by 伍宏彬 on 15/11/11.
//  Copyright © 2015年 伍宏彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBDrawingBoard.h"

typedef void(^EditImgBlock)(UIImage *img);

@interface PhotoViewController : UIViewController

-(instancetype)initWithBackImg:(UIImage *)image Edtior:(BOOL)isEdtior editorImg:(EditImgBlock)editImgBlock;

@property (nonatomic, strong) HBDrawingBoard *drawView;


@end

