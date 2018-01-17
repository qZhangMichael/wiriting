//
//  MyWorksListModel.h
//  WritingEducation
//  我的作品列表
//  Created by 张琼 on 2018/1/11.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "TeacherInfoModel.h"

extern  NSString *const MYWORKS_LIST;

@interface MyWorks_ApprovedWorksListModel :RequestModel

@property(nonatomic,strong)NSString *agentListUuid;
@property(nonatomic,strong)NSString *approvedTime;
@property(nonatomic,strong)NSString *imagePath;
@property(nonatomic,strong)NSString *uuid;
@end

@interface MyWorks_ChangeTheResultModel :RequestModel

@property(nonatomic,strong)NSString *agentListUuid;
@property(nonatomic,strong)NSString *dealTime;
@property(nonatomic,strong)NSString *dealer;
@property(nonatomic,strong)NSString *workEvaluation;
@property(nonatomic,assign)NSInteger worksScore;

@end

@interface MyWorks_CostInfoModel :RequestModel

@property(nonatomic,assign)NSInteger amount;
@property(nonatomic,strong)NSString *timeOfOccurrence;

@end

@interface MyWorks_WorksListModel :RequestModel

@property(nonatomic,strong)NSString *creationTime;
@property(nonatomic,strong)NSString *isItOpen;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *title;

@end

@interface MyWorks_MyWorksListModel : RequestModel

@property(nonatomic,strong)NSString *evaluationStatus;
@property(nonatomic,strong)NSString *submitTime;
@property(nonatomic,strong)NSString *sumitter;
@property(nonatomic,strong)NSString *taskTitle;
@property(nonatomic,strong)NSString *uuid;

@property(nonatomic,strong)NSArray *approvedWorksList;
@property(nonatomic,strong)MyWorks_ChangeTheResultModel *changeTheResult;
@property(nonatomic,strong)TeacherInfoModel *teacher;
@property(nonatomic,strong)NSArray *worksList;
@property(nonatomic,strong)MyWorks_CostInfoModel*costInfo;

@end

@interface MyWorksListModel :RequestModel

@property(nonatomic,strong)NSArray<MyWorks_MyWorksListModel*>*myWorksMList;

@end
