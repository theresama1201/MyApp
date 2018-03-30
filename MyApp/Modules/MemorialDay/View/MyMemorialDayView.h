//
//  MyMemorialDayView.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyMemorialDayModel;

@protocol MyMemorialDayViewDelegate;

@interface MyMemorialDayView : UIView

- (void)showMemorialDayViewWithDaysArray:(NSArray *)daysArray;
@property (weak, nonatomic) id <MyMemorialDayViewDelegate> delegate;

@end


@protocol MyMemorialDayViewDelegate <NSObject>

- (void)showsMemorialDayDetailView:(MyMemorialDayView *)myMemorialDayView withMemorialDayModel:(MyMemorialDayModel *)memorialDayModel;

@end
