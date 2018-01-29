//
//  AgentMListModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "AgentMListModel.h"


NSString *const URL_Agent_LIST =@"/soundapp/writer/agent/list";

@implementation AgentMListModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"agentMList":[AgentMModel class]
             };
}

@end
