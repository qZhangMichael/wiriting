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
        _imgView  = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imgView.image = [UIImage imageNamed:@"PersonCenter_3.png"];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}

@end
