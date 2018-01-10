//
//  RequestModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/10.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "BaseModel.h"

@interface RequestModel : BaseModel

@property(nonatomic,strong)NSString *error;
@property(nonatomic,strong)NSString *error_description;
@property(nonatomic,strong)NSString *flag;
@property(nonatomic,strong)NSString *msg;

-(BOOL)verificationReturnParms;

@end
