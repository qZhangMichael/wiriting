//
//  StudentInfoModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/13.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "StudentInfoModel.h"

@implementation StudentInfoModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"UserAccount":[UserAccountModel class]
             };
}
@end
