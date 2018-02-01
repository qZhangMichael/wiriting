//
//  UITextView+Placeholder.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/31.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "UITextView+Placeholder.h"

@implementation UITextView (Placeholder)

-(void)setPlaceholder:(NSString *)placeholdStr{
    [self setPlaceholder:placeholdStr placeholdColor:[UIColor grayColor]];
}

-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    
    /*
     [self setValue:(nullable id) forKey:(nonnull NSString *)]
     ps: KVC键值编码，对UITextView的私有属性进行修改
     */
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}
@end
