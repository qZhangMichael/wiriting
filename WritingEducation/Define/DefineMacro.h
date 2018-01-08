//
//  DefineMacro.h
//  WritingEducation
//
//  Created by 张琼 on 2017/12/11.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#ifndef DefineMacro_h
#define DefineMacro_h

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kPROPORTION  SCREEN_WIDTH/375                        //常规比例

//随机颜色
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define Color(R,G,B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
//颜色
#define TITLE_COLOR [UIColor blackColor]//标题颜色
#define TEXT_COLOR [UIColor grayColor]//正文颜色
#define TIPTEXT_COLOR UIColorFromRGB(0x888888)//提示语文本颜色
#define MAIN_GROUNDCOLOR  Color(164,224,239)//背景颜色
#define NavigationColor  Color(109,190,220)//导航栏颜色

//字体大小
#define TITLEFONT [UIFont systemFontOfSize:18]
#define TEXTFONT [UIFont systemFontOfSize:16]
#define TIPTEXTFONT [UIFont systemFontOfSize:12]


//默认函数
#define KUserDefaults [NSUserDefaults standardUserDefaults]
#define IsEmptyStr(string) (string == nil || string == NULL ||[string isKindOfClass:[NSNull class]]|| [string isEqualToString:@""] ||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ? YES : NO)
#endif /* DefineMacro_h */
