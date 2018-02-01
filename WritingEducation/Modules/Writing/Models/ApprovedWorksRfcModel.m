//
//  ApprovedWorksModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/31.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "ApprovedWorksRfcModel.h"

NSString *const URL_APPROVED_WORKS = @"/soundapp/writer/approved/works";

@implementation ApprovedWorksRfcModel

-(NSDictionary *)modelConvertDict{
    
    NSMutableDictionary *mutDict= [NSMutableDictionary dictionary];
    mutDict[@"agentListUuid"]=self.agentListUuid;//代办UUID
    mutDict[@"worksScore"]= [NSNumber numberWithFloat:self.worksScore.floatValue];//作品评分
    mutDict[@"workEvaluation"]=self.workEvaluation;//作品评价
    mutDict[@"dealer"]=self.dealer;//处理人
    mutDict[@"dealTime"]=self.dealTime;//处理时间
    return (NSDictionary*)mutDict;
    
}
@end
