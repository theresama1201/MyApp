//
//  UIView+Constraint.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/23.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "UIView+Constraint.h"

@implementation UIView (Constraint)

- (NSArray<NSLayoutConstraint *> *)addEdgesConstraintsEqualToView:(UIView *)view {
    return [self addEdgesConstraintsToView:view insets:UIEdgeInsetsZero];
}

- (NSArray<NSLayoutConstraint *> *)addEdgesConstraintsToView:(UIView *)view insets:(UIEdgeInsets)edgeInsets {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self addTopConstraintToView:view constant:edgeInsets.top]];
    [constraintArray addObject:[self addBottomConstraintToView:view constant:edgeInsets.bottom]];
    [constraintArray addObject:[self addLeadingConstraintToView:view constant:edgeInsets.left]];
    [constraintArray addObject:[self addTrailingConstraintToView:view constant:edgeInsets.right]];

    return [constraintArray copy];
}

- (NSArray<NSLayoutConstraint *> *)addSizeConstraintsEqualToView:(UIView *)view {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self addWidthConstraintEqualToView:view]];
    [constraintArray addObject:[self addHeightConstraintEqualToView:view]];

    return [constraintArray copy];
}

- (NSLayoutConstraint *)addWidthConstraint:(CGFloat)width {
    return [self addConstraintAttribute:NSLayoutAttributeWidth toView:nil constant:width];
}

- (NSLayoutConstraint *)addHeightConstraint:(CGFloat)height {
    return [self addConstraintAttribute:NSLayoutAttributeHeight toView:nil constant:height];
}

- (NSLayoutConstraint *)addWidthConstraintEqualToView:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeWidth toView:view multiplier:1];
}

- (NSLayoutConstraint *)addHeightConstraintEqualToView:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeHeight toView:view multiplier:1];
}

- (NSLayoutConstraint *)addTopConstraintEqualToView:(UIView *)view {
    return [self addTopConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)addTopConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeTop toView:view constant:constant];
}

- (NSLayoutConstraint *)addBottomConstraintEqualToView:(UIView *)view {
    return [self addBottomConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)addBottomConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeBottom toView:view constant:constant];
}

- (NSLayoutConstraint *)addLeadingConstraintEqualToView:(UIView *)view {
    return [self addLeadingConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)addLeadingConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeLeading toView:view constant:constant];
}

- (NSLayoutConstraint *)addTrailingConstraintEqualToView:(UIView *)view {
    return [self addTrailingConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)addTrailingConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeTrailing toView:view constant:constant];
}

- (NSLayoutConstraint *)addConstraintNextToViewHorizontally:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeLeading toView:view attribute:NSLayoutAttributeTrailing constant:0];
}

- (NSLayoutConstraint *)addConstraintNextToViewHorizontally:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeLeading toView:view attribute:NSLayoutAttributeTrailing constant:constant];
}

- (NSLayoutConstraint *)addConstraintNextToViewVertically:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeTop toView:view attribute:NSLayoutAttributeBottom constant:0];
}

- (NSLayoutConstraint *)addCenterConstraintEqualToViewHorizontally:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeCenterX toView:view attribute:NSLayoutAttributeCenterX constant:0];
}

- (NSLayoutConstraint *)addCenterConstraintEqualToViewVertically:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeCenterY toView:view attribute:NSLayoutAttributeCenterY constant:0];
}

- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)attribute toView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:attribute toView:view attribute:attribute constant:constant];
}

- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)attribute toView:(UIView *)view multiplier:(CGFloat)multiplier {
    return [self addConstraintAttribute:attribute toView:view attribute:attribute multiplier:multiplier];
}

- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)selfAttribute toView:(UIView *)view attribute:(NSLayoutAttribute)viewAttribute constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:selfAttribute relatedBy:NSLayoutRelationEqual toItem:view attribute:viewAttribute multiplier:1 constant:constant];
    [NSLayoutConstraint activateConstraints:@[constraint]];

    return constraint;
}

- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)selfAttribute toView:(UIView *)view attribute:(NSLayoutAttribute)viewAttribute multiplier:(CGFloat)multiplier {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:selfAttribute relatedBy:NSLayoutRelationEqual toItem:view attribute:viewAttribute multiplier:multiplier constant:0];
    [NSLayoutConstraint activateConstraints:@[constraint]];

    return constraint;
}

@end
