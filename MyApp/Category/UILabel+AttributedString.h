//
//  UILabel+AttributedString.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AttributedString)

// 由多个attributedString拼接成新的attributedString，item意为由文本或图片生成的单个attributedString
+ (NSAttributedString *)jointAttributedStringWithItems:(NSArray *)items;
// 由文本生成attributedString
+ (NSAttributedString *)attributedStringWithText:(NSString *)text textColor:(UIColor *)color textFont:(UIFont *)font;
+ (NSAttributedString *)attributedStringWithText:(NSString *)text textColor:(UIColor *)color textFont:(UIFont *)font hasUnderlineStyle:(BOOL)hasUnderLineStyle lineSpacing:(float)line paragraphSpacing:(float)paragraph;
// 由图片生成attributedString
+ (NSAttributedString *)attributedStringWithImage:(UIImage *)image imageBounds:(CGRect)bounds;

@end
