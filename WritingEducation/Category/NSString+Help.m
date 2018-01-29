//
//  NSString+Help.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "NSString+Help.h"

@implementation NSString (Help)

-(BOOL)isEqualZero{
    if ([self isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}

@end
