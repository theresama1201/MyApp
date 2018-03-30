//
//  UIButton+Category.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/29.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "UIButton+Category.h"
#import "UIColor+Hex.h"
#import "UIView+Frame.h"

@implementation UIButton (Category)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIColor imageWithColor:backgroundColor andHeight:self.height] forState:state];
}

@end
