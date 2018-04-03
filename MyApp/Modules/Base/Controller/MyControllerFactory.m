//
//  MyControllerFactory.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyControllerFactory.h"
#import "MyTabBarController.h"
#import "MyViewController.h"
#import "UIViewController+Initialize.h"
#import "UIColor+Hex.h"

@implementation MyControllerFactory

+ (UIViewController *)controllerWithType:(MyFactoryControllerType)type {
    UIViewController *controller;

    switch (type) {
        case MyFactoryControllerTypeMain:
            controller = [self mainController];
            break;
        case MyFactoryControllerTypeMyView:
            controller = [self myViewController];
            break;
    }

    return controller;
}

+ (MyTabBarController *)mainController {
    MyTabBarController *tabBarController = [[MyTabBarController alloc] init];
    return tabBarController;
}

+ (MyViewController *)myViewController {
    MyViewController *myViewController = [MyViewController initFromNib];
    return myViewController;
}

+ (UINavigationController *)standardNavigationController {
    UINavigationController *navigationController = [UINavigationController new];
    // For a custom shadow to be shown, a custom background image must also be set with -setBackgroundImage:forBarMetrics: (if the default background image is used, the default shadow image will be used).
    navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"tabbar_nav_line_img"];
    [navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    navigationController.navigationBar.translucent = NO;
    NSDictionary *textAttributes = @{
                                     NSForegroundColorAttributeName:[UIColor whiteColor],
                                     NSFontAttributeName:[UIFont systemFontOfSize:18]
                                     };
    navigationController.navigationBar.titleTextAttributes = textAttributes;
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    navigationController.navigationBar.barTintColor = [UIColor P2Color];

    return navigationController;
}

@end
