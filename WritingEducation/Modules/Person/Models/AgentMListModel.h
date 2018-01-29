//
//  AgentMListModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "AgentMModel.h"

extern NSString *const URL_Agent_LIST;

@interface AgentMListModel : RequestModel
//输入
@property(nonatomic,strong)NSString *agentStaff;
@property(nonatomic,strong)NSString *evaluationStatus;
//输出
@property(nonatomic,strong)NSArray *agentMList;//(Array[AgentM], optional): 代办 ,

@end
