//
//  TeacherPriceModel.h
//  WritingEducation
//  教师价格
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface TeacherPriceModel : RequestModel

@property(nonatomic,assign)NSInteger enabled;
@property(nonatomic,strong)NSString*endTime;
@property(nonatomic,strong)NSString*phoneNumber;
@property(nonatomic,assign)NSInteger price;
@property(nonatomic,strong)NSString*startTime;
@property(nonatomic,strong)NSString*uuid;

@end
