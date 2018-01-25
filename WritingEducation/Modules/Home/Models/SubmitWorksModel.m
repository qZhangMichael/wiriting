//
//  SubmitWorksModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/25.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "SubmitWorksModel.h"

@implementation SubmitWorksModel


-(NSDictionary*)modelConvertDict{
    
    NSMutableDictionary*dict = [NSMutableDictionary dictionary];
    dict[@"taskTitle"]  = self.taskTitle;
    dict[@"sumitter"]  = self.sumitter;
    dict[@"agentStaff"]  = self.agentStaff;
    dict[@"submitTime"]  = self.submitTime;
    dict[@"reviewTheWay"]  = self.reviewTheWay;
    dict[@"evaluationStatus"]  = self.evaluationStatus;
    dict[@"paymentStatus"]  = self.paymentStatus;
    dict[@"receiveTheFeeStaus"]  = self.receiveTheFeeStaus;
    dict[@"phoneNumber"]  = self.phoneNumber;
    dict[@"title"]  = self.title;
    dict[@"creationTime"]  = self.creationTime;
    dict[@"disItOpen"]  = self.disItOpen;
    dict[@"amount"]  = self.amount;
    dict[@"timeOfOccurrence"]  = self.timeOfOccurrence;
    
    return (NSDictionary*)dict;
}

@end
