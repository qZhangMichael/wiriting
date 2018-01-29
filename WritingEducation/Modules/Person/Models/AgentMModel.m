//
//  AgentMModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "AgentMModel.h"


@implementation AgentMModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"student":[StudentInfoModel class],
             @"costInfo":[CostInfoModel class],
             @"approvedWorksList":[ApprovedWorksModel class],
             @"changeTheResult":[ChangeTheResultModel class],
             @"worksList":[WorksModel class]
             };
}

@end
