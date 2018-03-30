//
//  UIColor+Hex.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

#pragma mark - Public Methods

+ (UIColor *)O1Color {
    return [self colorwithHex:0xff5a00];
}

+ (UIColor *)O2Color {
    return [self colorwithHex:0xfb8e00];
}

+ (UIColor *)O3Color {
    return [self colorwithHex:0xfff5ea];
}

+ (UIColor *)O4Color {
    return [self colorwithHex:0xF29B02];
}

+ (UIColor *)O5Color {
    return [self colorwithHex:0xfffaf4];
}

+ (UIColor *)B1Color {
    return [self colorwithHex:0x232323];
}

+ (UIColor *)B2Color {
    return [self colorwithHex:0x666666];
}

+ (UIColor *)B3Color {
    return [self colorwithHex:0x888888];
}

+ (UIColor *)B4Color {
    return [self colorwithHex:0xaaaaaa];
}

+ (UIColor *)B5Color {
    return [self colorwithHex:0xdddddd];
}

+ (UIColor *)B6Color {
    return [self colorwithHex:0xe6e6e6];
}

+ (UIColor *)B7Color {
    return [self colorwithHex:0xf5f5f5];
}

+ (UIColor *)P1Color {
    return [self colorwithHex:0xBE5660];
}

+ (UIColor *)P2Color {
    return [self colorwithHex:0xEC7F7F];
}

+ (UIColor *)P3Color {
    return [self colorwithHex:0xF1CECB];
}

+ (UIColor *)Blue1Color {
    return [self colorwithHex:0x3C93FA];
}

+ (UIColor *)Blue2Color {
    return [self colorwithHex:0x3C78FF];
}

+ (instancetype)colorWithHexString:(NSString *)hexString {
    return [self colorWithHexString:hexString alpha:1];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    hexString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    hexString = [hexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSRegularExpression *RegEx = [NSRegularExpression regularExpressionWithPattern:@"^[a-fA-F|0-9]{1,6}$" options:0 error:nil];
    NSUInteger match = [RegEx numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, hexString.length)];

    if (match == 0) {
        hexString = @"ffffff";
        alpha = 0;
    }

    switch (hexString.length) {
        case 1:
            hexString = [NSString stringWithFormat:@"%1$@%1$@%1$@%1$@%1$@%1$@", hexString];
            break;
        case 2:
            hexString = [NSString stringWithFormat:@"%1$@%1$@%1$@", hexString];
            break;
        case 3:
            hexString = [NSString stringWithFormat:@"%1$@%1$@", hexString];
            break;
        case 6:
            break;
        default:
            hexString = @"ffffff";
            alpha = 0;
            break;
    }

    return [self colorWithStandardHexString:hexString alpha:alpha];
}

+ (instancetype)colorwithHex:(NSInteger)hex {
    return [[self class] colorwithHex:hex alpha:1];
}

+ (instancetype)colorwithHex:(NSInteger)hex alpha:(CGFloat)alpha {
    UIColor *color = [[self class] colorWithR:(hex >> 16) & 0xff G:(hex >> 8) & 0xff B:hex & 0xff A:alpha];

    return color;
}

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue {
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
}

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIImage *)imageWithColor:(UIColor*)color andHeight:(CGFloat)height {
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (NSString *)hexString {
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    int redValue = red * 255;
    int greenValue = green * 255;
    int blueDec = blue * 255;
    NSString *hexString = [NSString stringWithFormat:@"%02x%02x%02x", redValue, greenValue, blueDec];

    return hexString;
}

#pragma mark - Private Methods

+ (instancetype)colorWithStandardHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    id color;
    unsigned int rgbValue;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    BOOL isRightRGBValue = [scanner scanHexInt:&rgbValue];

    if (isRightRGBValue) {
        color = [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:alpha];
    } else {
        color = [[self class] clearColor];
    }

    // 另一种处理，更直观。
    //    NSString *rString = [hexString substringWithRange:NSMakeRange(0, 2)];
    //    NSString *gString = [hexString substringWithRange:NSMakeRange(2, 2)];
    //    NSString *bString = [hexString substringWithRange:NSMakeRange(4, 2)];
    //    unsigned int r, g, b;
    //    BOOL rightRValue = [[NSScanner scannerWithString:rString] scanHexInt:&r];
    //    BOOL rightGValue = [[NSScanner scannerWithString:gString] scanHexInt:&g];
    //    BOOL rightBValue = [[NSScanner scannerWithString:bString] scanHexInt:&b];
    //
    //    if (rightRValue && rightGValue && rightBValue) {
    //        color = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
    //    } else {
    //        color = [UIColor clearColor];
    //    }

    return color;
}

@end
