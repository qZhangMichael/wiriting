//
//  PhotoCollectionViewCell.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/3.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "Masonry.h"
@implementation PhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self){
        
        [self addSubview:self.bgImgView];
        [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        _imgView  = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(_bgImgView).with.insets(UIEdgeInsetsMake(8, 10,20,10));
        }];
    }
    return self;
}

-(UIImageView *)bgImgView{
    if (_bgImgView ==nil) {
        _bgImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _bgImgView.image = [UIImage imageNamed:@"bg_register_certificate.png"];
    }
    return _bgImgView;
}

@end
