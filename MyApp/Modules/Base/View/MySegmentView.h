//
//  MySegmentView.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/23.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBaseView.h"

@protocol MySegmentViewDataSource;
@protocol MySegmentViewDelegate;

@interface MySegmentView : UIView

@property (nonatomic, weak) IBOutlet id<MySegmentViewDataSource> dataSource;
@property (nonatomic, weak) IBOutlet id<MySegmentViewDelegate> delegate;
@property (nonatomic) UIColor *titleContainerViewColor;
@property (nonatomic) UIColor *titleDefaultColor;
@property (nonatomic) UIColor *titleSelectedColor;
@property (nonatomic) UIColor *pointerLineViewColor;
@property (nonatomic) NSInteger titleContainerViewHeight;
@property (nonatomic) NSInteger pointerLineViewHeight;
@property (nonatomic) NSInteger selectedIndex;

@end

@protocol MySegmentViewDataSource <NSObject>

- (NSInteger)numberOfViewsInSegmentView:(MySegmentView *)segmentView;
- (NSString *)segmentView:(MySegmentView *)segmentView titleAtIndex:(NSInteger)index;
- (UIView *)segmentView:(MySegmentView *)segmentView viewAtIndex:(NSInteger)index;

@end

@protocol MySegmentViewDelegate <NSObject>

@optional
- (void)segmentView:(MySegmentView *)segmentView showViewAtIndex:(NSInteger)index;

@end
