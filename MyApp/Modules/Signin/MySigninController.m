//
//  MySigninController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/30.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MySigninController.h"
#import "MyControllerFactory.h"
#import "MyTextField.h"
#import "AppDelegate.h"

@interface MySigninController ()

@property (weak, nonatomic) IBOutlet MyTextField *userNameTextField;
@property (weak, nonatomic) IBOutlet MyTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *sigininButton;

@end

@implementation MySigninController

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setButtonState];
    [self addNotificationObserver];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Responder

- (void)clickBackButton {
    [[AppDelegate sharedAppDelegate] showTabBarController];
}

- (IBAction)clickDoneButton:(id)sender {
    [[AppDelegate sharedAppDelegate] showTabBarController];
}

- (void)textFieldTextDidChange {
    [self setButtonState];
}

#pragma mark - Private

- (void)setButtonState {
    if (self.userNameTextField.text.length != 0 && self.passwordTextField.text.length != 0) {
        self.sigininButton.userInteractionEnabled = YES;
        self.sigininButton.alpha = 1;
    } else {
        self.sigininButton.userInteractionEnabled = NO;
        self.sigininButton.alpha = 0.5;
    }
}

- (void)addNotificationObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange) name:UITextFieldTextDidChangeNotification object:nil];
}

@end
