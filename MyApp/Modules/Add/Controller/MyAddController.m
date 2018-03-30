//
//  MyAddController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyAddController.h"
#import "MyTextField.h"
#import "AppDelegate.h"
#import "UIView+Frame.h"

@interface MyAddController ()

@end

@implementation MyAddController

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    MyTextField *username = [[MyTextField alloc] initWithFrame:CGRectMake(30, 50, self.view.bounds.size.width - 60, 35)];
    username.placeholder = @"请输入用户名";
    [self.view addSubview:username];
    MyTextField *password = [[MyTextField alloc] initWithFrame:CGRectMake(30, 100, self.view.bounds.size.width - 60, 35)];
    password.placeholder = @"请输入密码";
    [self.view addSubview:password];
}

@end
