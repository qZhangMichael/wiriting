//
//  ReadPhotoViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "ReadPhotoViewController.h"

@interface ReadPhotoViewController ()

@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ReadPhotoViewController

-(instancetype)init:(UIImage *)image{
    
    if([super init]){
        self.imageView = [[UIImageView alloc]initWithImage:image];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithView];
    
}

-(void)initWithView{
    
    [self.view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(40);
        make.right.equalTo(self.view).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
}

-(void)btnClick:(id)action{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
