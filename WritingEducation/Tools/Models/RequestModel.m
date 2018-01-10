//
//  RequestModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/10.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@implementation RequestModel

-(BOOL)verificationReturnParms{
    
    if ([self.flag isEqualToString:@"failed"]||self.error!=nil) {
        return NO;
    }
    return YES;
    
    
    
}
@end
