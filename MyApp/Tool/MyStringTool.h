//
//  MyStringTool.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStringTool : NSObject

+ (BOOL)isEmpty:(NSString *)str;
+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)checkPasswordByEnglish:(NSString *)password;
+ (BOOL)checkPasswordByCharacter:(NSString *)password;
+ (BOOL)checkPasswordByNum:(NSString *)password;
+ (BOOL)isPureInt:(NSString*)string;
+ (BOOL)isPureFloat:(NSString*)string;
+ (BOOL)isPure:(NSString*)string;
+ (BOOL)checkUserName:(NSString *)string;
+ (BOOL)isChinese:(NSString *)string;

@end
