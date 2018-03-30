//
//  UIView+Border.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

- (void)drawAllBorderWithWidth:(float)borderWidth cornerRadius:(float)cornerRadius color:(UIColor *)color;
- (void)drawCycle;
- (void)drawHorizontalLine:(UIView *)view color:(UIColor *)color;

@end
