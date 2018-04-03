//
//  AppDelegate.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/21.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "AppDelegate.h"
#import "MyLaunchController.h"
#import "MyTabBarController.h"
#import "MyViewController.h"
#import "MySigninController.h"
#import "MyControllerFactory.h"
#import "UIViewController+Initialize.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIViewController *tabbarController;
@property (nonatomic, strong) UIViewController *myViewController;

@end

@implementation AppDelegate

#pragma mark - init

+ (AppDelegate *)sharedAppDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - override

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MyLaunchController *launchingController = [MyLaunchController initFromNib];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = launchingController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}

#pragma mark - public

- (void)successSigninApp {
    [self showTabBarController];
}

- (void)showMyView {
    self.window.rootViewController = self.myViewController;
}

- (void)showTabBarController {
    self.window.rootViewController = self.tabbarController;
}

- (void)showSigninView {
    MySigninController *signinController = [MySigninController initFromNib];
    UINavigationController *signinNavController = [MyControllerFactory standardNavigationController];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:signinController action:@selector(clickBackButton)];
    signinController.navigationItem.leftBarButtonItem = leftBarItem;
    signinNavController.viewControllers = @[signinController];
    self.window.rootViewController = signinNavController;
}

#pragma mark - getter

- (UIViewController *)tabbarController {
    if (!_tabbarController) {
        _tabbarController = [MyControllerFactory controllerWithType:MyFactoryControllerTypeMain];
    }

    return _tabbarController;

}

- (UIViewController *)myViewController {
    if (!_myViewController) {
        _myViewController = [MyControllerFactory controllerWithType:MyFactoryControllerTypeMyView];
    }

    return _myViewController;

}

@end
