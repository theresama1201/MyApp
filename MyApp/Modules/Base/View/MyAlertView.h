//
//  MyAlertView.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/29.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBaseView.h"

@protocol MyAlertViewDelegate;

@interface MyAlertView : MyBaseView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray<NSString *> *buttonTitles;
@property (nonatomic) NSInteger selectButtonIndex;
@property (nonatomic, weak) id<MyAlertViewDelegate> delegate;

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message delegate:(id<MyAlertViewDelegate>)delegate buttonTitles:(NSArray<NSString *> *)buttonTitles selectButtonIndex:(NSInteger)index;
- (void)show;

@end

@protocol MyAlertViewDelegate <NSObject>

- (void)alertView:(MyAlertView *)alertView didTapButtonIndex:(NSInteger)index;

@end
