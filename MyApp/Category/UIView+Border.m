//
//  UIView+Border.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "UIView+Border.h"
#import "UIView+Constraint.h"

@implementation UIView (Border)

- (void)drawAllBorderWithWidth:(float)borderWidth cornerRadius:(float)cornerRadius color:(UIColor *)color {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [color CGColor];
}

- (void)drawCycle {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width / 2;
}

- (void)drawHorizontalLine:(UIView *)view color:(UIColor *)color {
    UIView *separatorLineView = [[UIView alloc] init];
    separatorLineView.backgroundColor = color;
    [view addSubview:separatorLineView];
    separatorLineView.translatesAutoresizingMaskIntoConstraints = NO;
    [separatorLineView addHeightConstraint:1];
    [separatorLineView addTopConstraintEqualToView:view];
    [separatorLineView addLeadingConstraintEqualToView:view];
    [separatorLineView addTrailingConstraintEqualToView:view];
}

@end
