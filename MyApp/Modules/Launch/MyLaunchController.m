//
//  MyLaunchController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyLaunchController.h"
#import "AppDelegate.h"

@interface MyLaunchController ()

@end

@implementation MyLaunchController

#pragma mark - override

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openApp];
}

#pragma mark - private

- (void)openApp {
    [[AppDelegate sharedAppDelegate] successSigninApp];
}

@end
