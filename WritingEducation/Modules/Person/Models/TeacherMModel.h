//
//  TeacherMModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"
#import "TeacherPriceModel.h"
#import "UserAccountModel.h"
#import "QualificationCertificateModel.h"

@interface TeacherMModel : RequestModel

@property(nonatomic,strong)NSString*identificationNumber;// 身份证号码 ,
@property(nonatomic,strong)NSString*jobTitle;// 职称 ,
@property(nonatomic,strong)NSString*name;// 姓名 ,
@property(nonatomic,strong)NSString*phoneNumber;// 手机号码 ,
@property(nonatomic,strong)NSArray*qualificationCertificateList;//Array[QualificationCertificate]证书 ,
@property(nonatomic,strong)NSString*schoolName;// 学校名称 ,
@property(nonatomic,strong)TeacherPriceModel*teacherPrice;// 评阅费用 ,
@property(nonatomic,strong)UserAccountModel*userAccount;// 账号

@end
