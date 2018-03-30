//
//  UIView+Constraint.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/23.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

// 添加约束即已生效，无需额外执行激活操作，返回约束实例的目的是让操作者可以在之后动态的修改约束。
// 只支持 iOS8 及以上。添加约束的方法不会对视图自身做设置 translatesAutoresizingMaskIntoConstraints
// 属性为 NO 的操作，使用者应根据需要自行设置。
@interface UIView (Constraint)

- (NSArray<NSLayoutConstraint *> *)addEdgesConstraintsEqualToView:(UIView *)view;
- (NSArray<NSLayoutConstraint *> *)addEdgesConstraintsToView:(UIView *)view insets:(UIEdgeInsets)edgeInsets;
- (NSArray<NSLayoutConstraint *> *)addSizeConstraintsEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addWidthConstraint:(CGFloat)width;
- (NSLayoutConstraint *)addHeightConstraint:(CGFloat)height;
- (NSLayoutConstraint *)addWidthConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addHeightConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addTopConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addTopConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addBottomConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addBottomConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addLeadingConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addLeadingConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addTrailingConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)addTrailingConstraintToView:(UIView *)view constant:(CGFloat)constant;
// view.trailing - 0 - self.leading
- (NSLayoutConstraint *)addConstraintNextToViewHorizontally:(UIView *)view;
- (NSLayoutConstraint *)addConstraintNextToViewHorizontally:(UIView *)view constant:(CGFloat)constant;
// view.bottom - 0 - self.top
- (NSLayoutConstraint *)addConstraintNextToViewVertically:(UIView *)view;
- (NSLayoutConstraint *)addCenterConstraintEqualToViewHorizontally:(UIView *)view;
- (NSLayoutConstraint *)addCenterConstraintEqualToViewVertically:(UIView *)view;

@end

