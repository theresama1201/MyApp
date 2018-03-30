//
//  MySigninController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/30.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MySigninController.h"
#import "MyControllerFactory.h"
#import "AppDelegate.h"

@interface MySigninController ()

@end

@implementation MySigninController

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Responder

- (IBAction)clickBackButton:(id)sender {
    [[AppDelegate sharedAppDelegate] showTabBarController];
}

- (IBAction)clickDoneButton:(id)sender {
    
}

@end
