//
//  QualificationCertificateModel.h
//  WritingEducation
//
//  Created by 张琼 on 2018/1/16.
//  Copyright © 2018年 qzhangmichael. All rights reserved.
//

#import "RequestModel.h"

@interface QualificationCertificateModel : RequestModel

@property(nonatomic,strong)NSString*certificateName;//证书名称 ,
@property(nonatomic,strong)NSString*certificatePathDownload ;//证书下载路径 ,
@property(nonatomic,strong)NSString*certificatePathView ; //证书查看路径 ,
@property(nonatomic,strong)NSString*phoneNumber ; //手机号码/账号 ,
@property(nonatomic,strong)NSString*uuid ; //唯一标示--主键

@end
