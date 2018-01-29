//
//  AgentMModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "StudentInfoModel.h"
#import "CostInfoModel.h"
#import "ApprovedWorksModel.h"
#import "ChangeTheResultModel.h"
#import "WorksModel.h"

@interface AgentMModel : RequestModel

@property(nonatomic,strong)NSString *agentStaff;//(string)代办人 ,
@property(nonatomic,strong)NSString *evaluationStatus;//(string)评价状态 0:待评价 1:评价完成 ,
@property(nonatomic,strong)NSString *paymentStatus;//(string)缴费状态 0:未缴费 1:已缴费 ,
@property(nonatomic,strong)NSString *receiveTheFeeStaus;//(string)费用领用状态 0:未领取 1:已领取 ,
@property(nonatomic,strong)NSString *reviewTheWay;//(string)评阅方式 offline:离线 online:在线 ,
@property(nonatomic,strong)NSString *submitTime;//(string)提交时间 ,
@property(nonatomic,strong)NSString *sumitter;//(string)提交人 ,
@property(nonatomic,strong)NSString *taskTitle;//(string)任务(作品)名称/

@property(nonatomic,strong)StudentInfoModel *student;// (Student, optional): 学生信息/提交人信息 ,
@property(nonatomic,strong)CostInfoModel *costInfo;// (CostInfo, optional): 代办对应的缴费信息
@property(nonatomic,strong)NSArray *approvedWorksList;// (Array[ApprovedWorks], optional): 作品评阅结果图片 ,
@property(nonatomic,strong)NSArray *changeTheResult;// (Array[ChangeTheResult], optional): 评阅信息 ,
@property(nonatomic,strong)NSArray *worksList;// (Array[Works], optional): 代办对应的作品

@end
