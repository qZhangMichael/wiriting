//
//  WorksModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface WorksModel : RequestModel

@property(nonatomic,strong)NSString *creationTime ;//(string)创作时间 ,
@property(nonatomic,strong)NSString *isItOpen ;//(string)是否公开 0:否 1:是 ,
@property(nonatomic,strong)NSString *phoneNumber ;//(string)账号/手机号码/作品所有人 ,
@property(nonatomic,strong)NSString *title ;//(string)作品名称
@property(nonatomic,strong)NSString *uuid;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *imageContentPath;
@property(nonatomic,strong)NSString *agentListUuid;

@end
