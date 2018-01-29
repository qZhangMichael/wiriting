//
//  CostInfoModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface CostInfoModel : RequestModel

@property(nonatomic,strong)NSNumber *amount;//(number);// 金额 ,
@property(nonatomic,strong)NSString *timeOfOccurrence;//(string) 费用发生时间

@end
