//
//  MyAlertView.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/29.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyAlertView.h"
#import "SRMModalViewController.h"
#import "UIView+Frame.h"
#import "UIColor+Hex.h"
#import "UIButton+Category.h"
#import "UIView+Border.h"

static const CGFloat mImageViewWidth = 20;
static const CGFloat mViewLeftAndRightMargin = 35;
static const CGFloat mViewTopMargin = 20;
static const CGFloat mViewPadding = 20;
static const CGFloat mMessageTopMargin = 10;
static const CGFloat mButtonHeight = 40;
static const CGFloat mButtonTopMargin = 20;
static const CGFloat mTitleFontSize = 18;
static const CGFloat mMessageFontSize = 17;
static const CGFloat mButtonTitleFontSize = 17;

@interface MyAlertView ()

@property (nonatomic) SRMModalViewController *modalViewController;

@end

@implementation MyAlertView

#pragma mark - Init

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message delegate:(id<MyAlertViewDelegate>)delegate buttonTitles:(NSArray<NSString *> *)buttonTitles selectButtonIndex:(NSInteger)index {
    MyAlertView *alertView = [[MyAlertView alloc] init];
    alertView.title = title;
    alertView.message = message;
    alertView.delegate = delegate;
    alertView.buttonTitles = buttonTitles;
    alertView.selectButtonIndex = index;

    return alertView;
}

- (void)initialize {
    self.backgroundColor = [UIColor whiteColor];
    [self drawAllBorderWithWidth:1 cornerRadius:3 color:[UIColor B5Color]];
}


#pragma mark - Responder

- (void)didTapButton:(UIButton *)button {
    [self.modalViewController hide];

    if ([self.delegate respondsToSelector:@selector(alertView:didTapButtonIndex:)]) {
        [self.delegate alertView:self didTapButtonIndex:button.tag];
    }
}

#pragma mark - Public

- (void)show {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    // add image
    [self addImageView];
    // add title and calculate super view's height
    CGFloat viewHeight = mViewTopMargin;
    UILabel *titleLabel = [self addTitleLabel];
    titleLabel.originY = viewHeight;
    viewHeight += titleLabel.height;
    // add Message and calculate super view's height
    UILabel *messageLabel = [self addMessageLabel];
    messageLabel.originY = titleLabel ? viewHeight + mMessageTopMargin : viewHeight;
    viewHeight += titleLabel && messageLabel ? mMessageTopMargin : 0;
    viewHeight += messageLabel.height;
    // add button and calculate super view's height
    UIView *buttonView = [self addButtonView];
    buttonView.originY = viewHeight + mButtonTopMargin;
    viewHeight += mButtonTopMargin + buttonView.height;
    CGFloat viewWidth = [self viewWidth];
    // show alert view
    self.frame = CGRectMake(0, 0, viewWidth, viewHeight);
    self.modalViewController = [[SRMModalViewController alloc] init];
    self.modalViewController.enableTapOutsideToDismiss = NO;
    [self.modalViewController showView:self];
}

#pragma mark - Private

- (void)addImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([self viewWidth] - mImageViewWidth, 0, mImageViewWidth, mImageViewWidth)];
    imageView.image = [UIImage imageNamed:@"alertview_meaaage_icon"];
    [self addSubview:imageView];
}

- (UILabel *)addTitleLabel {
    if (!self.title || [self.title isEqualToString:@""]) {
        return nil;
    }

    UIFont *titleFont = [UIFont boldSystemFontOfSize:mTitleFontSize];
    CGFloat titleWidth = [self viewWidth] - mViewPadding * 2;
    CGRect titleRect = [self.title boundingRectWithSize:CGSizeMake(titleWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil];
    titleRect.size.width = MAX(titleWidth, titleRect.size.width);
    titleRect.origin.x = mViewPadding;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleRect];
    titleLabel.numberOfLines = 0;
    titleLabel.text = self.title;
    titleLabel.font = titleFont;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor P2Color];
    [self addSubview:titleLabel];

    return titleLabel;
}

- (UILabel *)addMessageLabel {
    if (!self.message || [self.message isEqualToString:@""]) {
        return nil;
    }

    UIFont *messageFont = [UIFont systemFontOfSize:mMessageFontSize];
    CGFloat messageWidth = [self viewWidth] - mViewPadding * 2;
    CGRect messageRect = [self.message boundingRectWithSize:CGSizeMake(messageWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:messageFont} context:nil];
    messageRect.size.width = MAX(messageWidth, messageRect.size.width);
    messageRect.origin.x = mViewPadding;
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:messageRect];
    messageLabel.text = self.message;
    messageLabel.font = messageFont;
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = [UIColor B2Color];
    [self addSubview:messageLabel];

    return messageLabel;
}

- (UIView *)addButtonView {
    __block CGFloat originX = 0;
    UIView *buttonContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self viewWidth], mButtonHeight + 1)];
    CGFloat buttonWidth = (buttonContainerView.width / self.buttonTitles.count) - (self.buttonTitles.count - 1);

    [self.buttonTitles enumerateObjectsUsingBlock:^(NSString * title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(originX, 0, buttonWidth, mButtonHeight);
        [button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = idx;
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:idx == self.selectButtonIndex ? [UIColor P2Color] : [UIColor B2Color] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:mButtonTitleFontSize];
        [buttonContainerView addSubview:button];
        originX += buttonWidth;

        if (idx != self.buttonTitles.count - 1) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(originX, 0, 1, mButtonHeight)];
            line.backgroundColor = [UIColor B5Color];
            [buttonContainerView addSubview:line];
            originX += 1;
        }
    }];

    [self drawHorizontalLine:buttonContainerView color:[UIColor B5Color]];
    [self addSubview:buttonContainerView];

    return buttonContainerView;
}

- (CGFloat)viewWidth {
    return CGRectGetWidth([UIScreen mainScreen].bounds) - mViewLeftAndRightMargin * 2;
}

@end
