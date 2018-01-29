//
//  MyWalletViewController.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "MyWalletViewController.h"
#import "TextImageView.h"
#import "LongButton.h"

@interface MyWalletViewController ()

@property(nonatomic,strong)TextImageView *moneyImgView;
@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的钱包";
    [self initWithView];
}

-(void)initWithView{

    CGFloat updownGap = 8;
    CGFloat leftGap = 30*kPROPORTION;
    CGFloat height = 45*kPROPORTION;
    
    //    NSString *scoreStr = [NSString stringWithFormat: @"%ld", (long)_productModel.changeTheResult.worksScore];
    _moneyImgView = [[TextImageView alloc]initWithFrame:CGRectZero backgroudImg:@"mywallet_1.png" content:@"500" edg:UIEdgeInsetsMake(110, 40, 72, 80)];
    _moneyImgView.contentText.font = [UIFont systemFontOfSize:30.f];
    _moneyImgView.contentText.textAlignment = NSTextAlignmentCenter;
    _moneyImgView.contentText.userInteractionEnabled = NO;
    [self.view addSubview:_moneyImgView];
    [_moneyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(updownGap*5);
        make.size.mas_equalTo(CGSizeMake(200, 240));
    }];
    
    LongButton *loginBtn =[LongButton buttonWithType:UIButtonTypeCustom title:@"提现到微信" image:@"mywallet_4.png" handler:^(UIButton *sender) {
        NSLog(@"提现");
//        [self clickLogin];
        [self showAlert:@"提现到微信"];
    }];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_moneyImgView.mas_bottom).with.offset(updownGap*5);
        make.left.equalTo(self.view).with.offset(leftGap);
        make.right.equalTo(self.view).with.offset(-leftGap);
        make.height.mas_equalTo(height);
    }];
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
