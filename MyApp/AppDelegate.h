//
//  AppDelegate.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/21.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedAppDelegate;
- (void)successSigninApp;
- (void)showTabBarController;
- (void)showMyView;

@end

