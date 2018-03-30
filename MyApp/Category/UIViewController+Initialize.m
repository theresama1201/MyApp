//
//  UIViewController+Initialize.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "UIViewController+Initialize.h"
#import "AppDelegate.h"

@implementation UIViewController (Initialize)

+ (instancetype)initFromNib {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

- (void)customiseNavigationBackItem {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回上頁" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIImage *backIconImage = [UIImage imageNamed:@"nav_back_icon"];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(backIconImage.size.width, backIconImage.size.height + 2), NO, 0);
    [backIconImage drawAtPoint:CGPointMake(0, 0)];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackIndicatorImage:processedImage];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:processedImage];
}

- (void)customiseNavigationRightBarButtonItem {
//    if (![KRUserDefaultsService boolForKey:kKRUserDefaultsServiceKeyShouldOpenWebShop]) {
//        return;
//    }

//    UIBarButtonItem *rightMoreInformationItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_more_icon"] style:UIBarButtonItemStyleDone target:[AppDelegate sharedAppDelegate] action:@selector(showMoreInformationView)];
//    self.navigationItem.rightBarButtonItem = rightMoreInformationItem;
}

- (void)kr_loadViewIfNeeded {
    if ([self respondsToSelector:@selector(loadViewIfNeeded)]) {
        [self loadViewIfNeeded];
    } else {
        // [- loadViewIfNeeded] 只支持 iOS9 及以上版本
        self.view = self.view;
    }
}

@end
