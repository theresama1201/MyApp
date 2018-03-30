//
//  UIViewController+Initialize.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Initialize)

+ (instancetype)initFromNib;
- (void)customiseNavigationBackItem;
- (void)customiseNavigationRightBarButtonItem;
- (void)kr_loadViewIfNeeded;

@end
