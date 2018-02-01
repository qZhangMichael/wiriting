//
//  BaseViewController+InputView.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/31.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseViewController+InputImageView.h"

@implementation BaseViewController (InputImageView)

-(void)toAlertSelect:(UITextField *)textField titleArray:(NSArray <NSString*> *)titleArray{
    
    UIAlertController *alerVc = [UIAlertController alertControllerWithTitle:textField.placeholder message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *title in titleArray) {
        [alerVc addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            textField.text = action.title;
        }]];
    }
    [self presentViewController:alerVc animated:YES completion:nil];
}
@end
