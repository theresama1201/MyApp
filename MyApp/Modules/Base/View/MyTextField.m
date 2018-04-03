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
#import "UIView+Frame.h"

/**
    由于 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string；无法监听文本框的联想输入,如果想要通过实现该代理方法来实现这样的效果，需要self.autocorrectionType = UITextAutocorrectionTypeNo(阻止键盘自动联想);可以参考自己简书上通过实现UITextFieldDelegate的代理方法- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string做的效果。
 */

@interface MyTextField()

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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholder:(NSString *)placeholder {
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:16],
                                 NSForegroundColorAttributeName : [UIColor grayColor]
                                 };
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    self.attributedPlaceholder = attributedPlaceholder;
}

#pragma mark - Responder

- (void)textFieldTextDidChange {
    if (self.text.length != 0) {
        [self setSelectedStyle];
    } else {
        [self setNormalStyle];
    }
}

#pragma mark - Private

- (void)initialize {
    self.font = [UIFont systemFontOfSize:16];
    self.textColor = [UIColor B1Color];
    [self setNormalStyle];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)setNormalStyle {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textfield_pen_icon"]];
    imageView.contentMode = UIViewContentModeLeft;
    self.leftView = imageView;
    self.leftView.width = 30;
    self.leftViewMode = UITextFieldViewModeAlways;
    [self drawBottomBorder:1 color:[UIColor B5Color]];
}

- (void)setSelectedStyle {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textfield_smile_icon"]];
    imageView.contentMode = UIViewContentModeLeft;
    self.leftView = imageView;
    self.leftView.width = 30;
    self.leftViewMode = UITextFieldViewModeAlways;
    [self drawBottomBorder:1 color:[UIColor P2Color]];
}

@end
