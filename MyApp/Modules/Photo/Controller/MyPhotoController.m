//
//  MyPhotoController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyPhotoController.h"
#import "MySegmentView.h"
#import "UIColor+Hex.h"

@interface MyPhotoController ()

@property (nonatomic) NSArray *titleArray;
@property (nonatomic) NSArray *viewArray;

@end

@implementation MyPhotoController

- (void)viewDidLoad {
    self.titleArray = @[@" 全部 ", @" 毕业前 ", @" 济南 ", @" 杭州 ", @" 宁德 ", @" 乌镇 ", @" 上海 "];
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor P1Color];
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor O3Color];
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor B1Color];
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor B2Color];
    UIView *view5 = [UIView new];
    view5.backgroundColor = [UIColor B3Color];
    UIView *view6 = [UIView new];
    view6.backgroundColor = [UIColor O1Color];
    UIView *view7 = [UIView new];
    view6.backgroundColor = [UIColor O1Color];

    self.viewArray = @[view1, view2, view3, view4, view5, view6, view7];
}


#pragma mark - KRGalleryViewDataSource

- (NSInteger)numberOfViewsInSegmentView:(MySegmentView *)segmentView {
    return self.viewArray.count;
}


- (UIView *)segmentView:(MySegmentView *)segmentView viewAtIndex:(NSInteger)index {
    return self.viewArray[index];
}

- (NSString *)segmentView:(MySegmentView *)segmentView titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

@end
