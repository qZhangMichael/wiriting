//
//  SubmitWorksModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/25.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseModel.h"

extern NSString *const URL_SUBMIT_WORKS;

@interface SubmitWorksModel : BaseModel

@property(nonatomic,strong)NSString *taskTitle;//任务(作品)名称
@property(nonatomic,strong)NSString *sumitter;//提交人
@property(nonatomic,strong)NSString *agentStaff;//代办人
@property(nonatomic,strong)NSString *submitTime;//提交时间
@property(nonatomic,strong)NSString *reviewTheWay;//评阅方式 offline:离线 online:在线
@property(nonatomic,strong)NSString *evaluationStatus;//评价状态 0:待评价 1:评价完成
@property(nonatomic,strong)NSString *paymentStatus;//缴费状态 0:未缴费 1:已缴费
@property(nonatomic,strong)NSString *receiveTheFeeStaus;//费用领用状态 0:未领取 1:已领取
@property(nonatomic,strong)NSString *phoneNumber;//账号/手机号码/作品所有人
@property(nonatomic,strong)NSString *title;//作品名称
@property(nonatomic,strong)NSString *creationTime;//创作时间
@property(nonatomic,strong)NSString *isItOpen;//是否公开 0:否 1:是
@property(nonatomic,assign)float amount;//金额
@property(nonatomic,strong)NSString *timeOfOccurrence;//费用发生时间

-(NSDictionary*)modelConvertDict;

@end
