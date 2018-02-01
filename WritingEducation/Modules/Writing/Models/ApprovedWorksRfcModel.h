//
//  ApprovedWorksModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/31.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

extern NSString *const URL_APPROVED_WORKS;

@interface ApprovedWorksRfcModel : RequestModel

@property(nonatomic,strong)NSString *agentListUuid;//代办UUID
@property(nonatomic,strong)NSString *worksScore;//作品评分
@property(nonatomic,strong)NSString *workEvaluation;//作品评价
@property(nonatomic,strong)NSString *dealer;//处理人
@property(nonatomic,strong)NSString *dealTime;//处理时间

-(NSDictionary *)modelConvertDict;
@end
