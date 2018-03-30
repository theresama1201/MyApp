//
//  UIColor+Hex.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

@import UIKit;

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

@interface UIColor (Hex)

+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (instancetype)colorwithHex:(NSInteger)hex;
+ (instancetype)colorwithHex:(NSInteger)hex alpha:(CGFloat)alpha;
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;
// 画指定高度和颜色的图片
+ (UIImage*)imageWithColor:(UIColor*)color andHeight:(CGFloat)height;

+ (UIColor *)O1Color;
+ (UIColor *)O2Color;
+ (UIColor *)O3Color;
+ (UIColor *)O4Color;
+ (UIColor *)O5Color;
+ (UIColor *)B1Color;
+ (UIColor *)B2Color;
+ (UIColor *)B3Color;
+ (UIColor *)B4Color;
+ (UIColor *)B5Color;
+ (UIColor *)B6Color;
+ (UIColor *)B7Color;
+ (UIColor *)P1Color;
+ (UIColor *)P2Color;
+ (UIColor *)P3Color;
+ (UIColor *)Blue1Color;
+ (UIColor *)Blue2Color;

- (NSString *)hexString;

@end
