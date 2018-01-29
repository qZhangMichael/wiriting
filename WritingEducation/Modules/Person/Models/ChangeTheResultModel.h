//
//  ChangeTheResultModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface ChangeTheResultModel : RequestModel

@property(nonatomic,strong)NSString *agentListUuid;//(string)代办UUID ,
@property(nonatomic,strong)NSString *dealTime;//(string)处理时间 ,
@property(nonatomic,strong)NSString *dealer;//(string)处理人 ,
@property(nonatomic,strong)NSString *workEvaluation;//(string)作品评价 ,
@property(nonatomic,strong)NSNumber *worksScore;//(number, optional): 作品评分

@end
