//
//  MyTextField.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/30.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyTextField.h"
#import "UIColor+Hex.h"
#import "UIView+Border.h"

@interface MyTextField() <UITextFieldDelegate>

@end

@implementation MyTextField

#pragma mark - Override

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }

    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:16],
                                 NSForegroundColorAttributeName : [UIColor grayColor]
                                 };
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    self.attributedPlaceholder = attributedPlaceholder;
}

#pragma mark- UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSMutableString * changedString=[[NSMutableString alloc] initWithString:textField.text];
    [changedString replaceCharactersInRange:range withString:string];

    if (changedString.length == 0) {
         [self setNormalStyle];
    }else{
        [self setSelectedStyle];
    }

    return YES;
}

#pragma mark - Private

- (void)initialize {
    self.delegate = self;
    self.font = [UIFont systemFontOfSize:16];
    self.textColor = [UIColor B1Color];
    [self setNormalStyle];
}

- (void)setNormalStyle {
    self.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textfield_pen_icon"]];
    self.leftViewMode = UITextFieldViewModeAlways;
    [self drawBottomBorder:1 color:[UIColor B5Color]];

}

- (void)setSelectedStyle {
    self.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textfield_smile_icon"]];
    self.leftViewMode = UITextFieldViewModeAlways;
    [self drawBottomBorder:1 color:[UIColor P2Color]];
}

@end
