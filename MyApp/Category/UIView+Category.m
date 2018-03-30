//
//  UIView+Category.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)clearSubviews {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

- (UIView *)findFirstResponder {
    if (self.isFirstResponder) {
        return self;
    }

    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];

        if (firstResponder != nil) {
            return firstResponder;
        }
    }

    return nil;
}

@end
