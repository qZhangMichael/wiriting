//
//  UpdatePhotoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/18.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "UpdatePhotoViewController.h"
#import "TZImagePickerController.h"

@interface UpdatePhotoViewController ()<UITabBarDelegate,TZImagePickerControllerDelegate>

@end

@implementation UpdatePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"111";
    self.view.backgroundColor = [UIColor clearColor];
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]initWithMaxImagesCount:3 delegate:self];
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [self removeFromParentViewController];
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
