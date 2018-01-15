//
//  ClientUserModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/11.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

extern NSString *const STUDENT_BASEINFO;

@interface  UserAccountModel : BaseModel

@property(nonatomic,strong)NSString *accountType;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)NSString *registeredTime;

@end


//@interface StudentInfoModel : BaseModel
//
//@property(nonatomic,strong)NSString *age;//0,
//@property(nonatomic,strong)NSString *gradeCode;//string",
//@property(nonatomic,strong)NSString *gradeDesc;//string",
//@property(nonatomic,strong)NSString *name;//string",
//@property(nonatomic,strong)NSString *phoneNumber;//string",
//@property(nonatomic,strong)NSString *schoolName;//string",
//@property(nonatomic,strong)UserAccountModel * userAccount;
//
//@end

@interface StudentBaseinfoModel : RequestModel

//@property(nonatomic,strong)StudentInfoModel *studentInfo;


@end


