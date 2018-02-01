//
//  ApprovedWorksModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/28.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface ApprovedWorksModel : RequestModel

@property(nonatomic,strong)NSString *agentListUuid;//(string) 代办UUID
@property(nonatomic,strong)NSString *approvedTime;//(string) 评阅时间
@property(nonatomic,strong)NSString *imagePath;//(string) 评阅后的作品图片保存的路径
@property(nonatomic,strong)NSString *uuid;//(string) 主键UUID


@end
