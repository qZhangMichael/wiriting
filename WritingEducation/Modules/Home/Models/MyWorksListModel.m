//
//  MyWorksListModel.m
//  WritingEducation
//
//  Created by 张琼 on 2018/1/11.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "MyWorksListModel.h"

NSString *const MYWORKS_LIST = @"/soundapp/writer/myworks/list/15122223333";

@implementation MyWorks_ApprovedWorksListModel

@end

@implementation MyWorks_ChangeTheResultModel

@end

@implementation MyWorks_CostInfoModel

@end

@implementation MyWorks_WorksListModel

@end

@implementation MyWorks_MyWorksListModel

+(NSDictionary *)modelContainerPropertyGenericClass{

    return @{
             @"approvedWorksList":[MyWorks_ApprovedWorksListModel class],
             @"worksList":[MyWorks_WorksListModel class],
             @"changeTheResult":[MyWorks_ChangeTheResultModel class],
             @"teacher":[TeacherInfoModel class],
             @"costInfo":[MyWorks_CostInfoModel class]
             };
}
@end

@implementation MyWorksListModel 

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"myWorksMList":[MyWorks_MyWorksListModel class]
             };
}
@end

