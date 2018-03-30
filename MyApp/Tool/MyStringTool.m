//
//  MyStringTool.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyStringTool.h"

@implementation MyStringTool

/*!
 *  @brief 判斷string是否是空
 */
+ (BOOL)isEmpty:(NSString *)str {
    return str == nil || [str isEqual:@""] || [str isEqual:[NSNull null]];
}

/*!
 *  @brief  正則表達式驗證郵箱l
 */
+ (BOOL) validateEmail:(NSString *)email {
    NSString *emailRegex = @"^\\w+([-.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/*!
 *  @brief  判斷密碼是否含字母
 */
+ (BOOL)checkPasswordByEnglish:(NSString *)password {
    NSString *pattern = @"(.*?)[a-zA-Z]+(.*?)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:password];
}

/*!
 *  @brief  判斷密碼是否含有特殊符號
 */
+ (BOOL)checkPasswordByCharacter:(NSString *)password {
    NSString *pattern = @"^[A-Za-z0-9`~!@#$%^&*()_=+-]{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:password];
}

/*!
 *  @brief  判斷密碼是否含有數字
 */
+ (BOOL)checkPasswordByNum:(NSString *)password {
    NSString *pattern = @"(.*?)\\d+(.*?)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:password];
}

/*!
 *  @brief  判斷是否是整形
 */
+ (BOOL)isPureInt:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/*!
 *  @brief  判斷是否是浮點型
 */
+ (BOOL)isPureFloat:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/*!
 *  @brief  判斷是否是整數
 */
+ (BOOL)isPure:(NSString*)string {
    if (![self isPureInt:string] || ![self isPureFloat:string]) {
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)checkUserName:(NSString *)string {
    NSString *pattern = @"(.*?)[0-9~!@#$%^&*()_=+-.]+(.*?)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:string];
}

+ (BOOL)isChinese:(NSString *)string {
    NSString *pattern = @"^[\\u4e00-\\u9fa5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:string];
}

@end
