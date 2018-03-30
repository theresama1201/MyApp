//
//  MySegmentView.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/23.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MySegmentView.h"
#import "UIColor+Hex.h"
#import "UIView+Frame.h"
#import "UIView+Constraint.h"

@interface MySegmentView()<UIScrollViewDelegate>

@property (nonatomic) UIScrollView *titleContainerView;
@property (nonatomic) UIScrollView *contentContainerScrollView;
@property (nonatomic) UIView *pointerLineView;
@property (nonatomic) BOOL needsLoadDataViews;
@property (nonatomic) UIButton *selectedTitleButton;
@property (nonatomic) NSInteger totalTitleButtonWidth;
@property (nonatomic) NSMutableArray *titleButtonWidthArray;

@end

@implementation MySegmentView

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

- (void)layoutSubviews {
    [super layoutSubviews];

    if (self.needsLoadDataViews) {
        [self loadDataViews];
        self.selectedIndex = self.selectedIndex;
        self.needsLoadDataViews = NO;
    }
}

#pragma mark - Responder

- (void)didTapTitleButton:(UIButton *)titleButton {
    if (self.selectedTitleButton == titleButton) {
        return;
    }

    CGFloat offsetX = titleButton.tag * self.contentContainerScrollView.width;
    [self.contentContainerScrollView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
    [titleButton setTitleColor:self.titleSelectedColor forState:UIControlStateNormal];
    [self.selectedTitleButton setTitleColor:self.titleDefaultColor forState:UIControlStateNormal];
    self.selectedTitleButton = titleButton;
    _selectedIndex = titleButton.tag;
    [self correctHeader:nil];

    if ([self.delegate respondsToSelector:@selector(segmentView:showViewAtIndex:)]) {
        [self.delegate segmentView:self showViewAtIndex:titleButton.tag];
    }
}

- (void)correctHeader:(UIScrollView *)scrollView {
    NSInteger previousTotalWidth = 0;

    for (int i = 0; i < self.selectedIndex; i++) {
        previousTotalWidth += [[self.titleButtonWidthArray objectAtIndex:i] integerValue];
    }

    //处理边界
    CGFloat selectWidth = [[self.titleButtonWidthArray objectAtIndex:self.selectedIndex] integerValue];
    CGFloat offset = previousTotalWidth + (selectWidth - MainScreenWidth) * 0.5 ;
    offset = MIN(self.totalTitleButtonWidth - MainScreenWidth, MAX(0, offset));
    [self.titleContainerView setContentOffset:CGPointMake(offset, 0) animated:YES];

    //滑块
    [UIView animateWithDuration:0.1 animations:^{
        self.pointerLineView.originX = previousTotalWidth;
        self.pointerLineView.width = selectWidth;
    }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;

    // 当 sroll view 滑动到边界时，如果继续向同方向滑动则会再次触发该代理方法，但重新设置选中
    // title 及调用代理方法的操作不应重复执行。
    if (index == self.selectedTitleButton.tag) {
        return;
    }

    UIButton *titleButton = self.titleContainerView.subviews[index + 1];
    self.selectedTitleButton = titleButton;
    _selectedIndex = index;
    [self correctHeader:scrollView];

    if ([self.delegate respondsToSelector:@selector(segmentView:showViewAtIndex:)]) {
        [self.delegate segmentView:self showViewAtIndex:index];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat value = scrollView.contentOffset.x / scrollView.width;
    NSInteger contentCount = scrollView.contentSize.width / scrollView.width;
    NSInteger index = (NSInteger)value;
    float level = value - index;
    UIButton *titleButton = self.titleContainerView.subviews[index + 1];
    [titleButton setTitleColor:[self middleColorWithRatio:1 - level] forState:UIControlStateNormal];

    if (index < contentCount - 1) {
        UIButton *nextTitleButton = self.titleContainerView.subviews[index + 1 + 1];
        [nextTitleButton setTitleColor:[self middleColorWithRatio:level] forState:UIControlStateNormal];
    }
}

#pragma mark - Private

- (void)initialize {
    self.needsLoadDataViews = YES;
    self.titleButtonWidthArray = [NSMutableArray array];
    [self initializeTitleContainerView];
    [self initializeContentContainerView];
    [self setConstraints];
}

- (void)initializeTitleContainerView {
    UIScrollView *titleContainerView = [[UIScrollView alloc] init];
    titleContainerView.showsVerticalScrollIndicator = NO;
    titleContainerView.showsHorizontalScrollIndicator = NO;
    titleContainerView.bounces = NO;
    titleContainerView.backgroundColor = self.titleContainerViewColor;
    titleContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    titleContainerView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    titleContainerView.layer.shadowOffset = CGSizeMake(0, 1);
    titleContainerView.layer.shadowRadius = 0;
    titleContainerView.layer.shadowOpacity = 1;
    self.titleContainerView = titleContainerView;
    [self addSubview:self.titleContainerView];

    if (@available(iOS 11, *)) {
        self.titleContainerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

- (void)initializeContentContainerView {
    UIScrollView *contentContainerScrollView = [[UIScrollView alloc] init];
    contentContainerScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    contentContainerScrollView.pagingEnabled = YES;
    contentContainerScrollView.bounces = NO;
    contentContainerScrollView.showsVerticalScrollIndicator = NO;
    contentContainerScrollView.showsHorizontalScrollIndicator = NO;
    contentContainerScrollView.delegate = self;
    self.contentContainerScrollView = contentContainerScrollView;
    // In case hide shadow of title container view.
    [self insertSubview:self.contentContainerScrollView atIndex:0];

    if (@available(iOS 11, *)) {
        self.contentContainerScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

- (void)loadDataViews {
    NSInteger length = [self.dataSource numberOfViewsInSegmentView:self];
    UIButton *lastTitleButton;
    UIView *lastContentView;
    [self calculateTitleButtonWidth];
    [self initializePointerLineViewView];

    for (NSInteger index = 0 ; index < length ; index++) {
        BOOL isFinal = index == length - 1;
        UIButton *titleButton = [self loadTitleButtonAtIndex:index];
        [self setConstraintsOfTitleButton:titleButton atIndex:index withLastTitleButton:lastTitleButton isFinal:isFinal];
        lastTitleButton = titleButton;
        UIView *contentView = [self loadContentViewAtIndex:index];
        [self setConstraintsOfContentView:contentView atIndex:index withLastContentView:lastContentView isFinal:isFinal];
        lastContentView = contentView;
    }
}

- (void)calculateTitleButtonWidth {
    NSInteger length = [self.dataSource numberOfViewsInSegmentView:self];

    for (NSInteger index = 0 ; index < length ; index++) {
        NSString *title = [self.dataSource segmentView:self titleAtIndex:index];
        CGFloat buttonWidth = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.width + 20;
        [self.titleButtonWidthArray addObject:@(buttonWidth)];
        self.totalTitleButtonWidth += buttonWidth;
    }

    // 如果总的宽度不足屏幕宽度，则平分屏幕宽度
    if (self.totalTitleButtonWidth < MainScreenWidth) {
        self.totalTitleButtonWidth = MainScreenWidth;
        [self.titleButtonWidthArray removeAllObjects];

        for (NSInteger index = 0 ; index < length ; index++) {
             [self.titleButtonWidthArray addObject:@(MainScreenWidth / length)];
        }
    }
}

- (void)initializePointerLineViewView {
    UIView *pointerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.titleContainerView.height - self.pointerLineViewHeight, [[self.titleButtonWidthArray objectAtIndex:0] integerValue], self.pointerLineViewHeight)];
    pointerLineView.backgroundColor = self.pointerLineViewColor;
    self.pointerLineView = pointerLineView;
    [self.titleContainerView addSubview:self.pointerLineView];
}

- (UIButton *)loadTitleButtonAtIndex:(NSInteger)index {
    NSString *title = [self.dataSource segmentView:self titleAtIndex:index];
    UIButton *titleButton = [self buttonWithTitle:title index:index];
    [self.titleContainerView addSubview:titleButton];

    return titleButton;
}

- (UIView *)loadContentViewAtIndex:(NSInteger)index {
    UIView *contentView = [self.dataSource segmentView:self viewAtIndex:index];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [contentView removeFromSuperview];
    [self.contentContainerScrollView addSubview:contentView];

    return contentView;
}

- (UIButton *)buttonWithTitle:(NSString *)title index:(NSInteger)index {
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.translatesAutoresizingMaskIntoConstraints = NO;
    titleButton.tag = index;
    titleButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setTitleColor:self.titleDefaultColor forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(didTapTitleButton:) forControlEvents:UIControlEventTouchUpInside];

    return titleButton;
}

- (UIColor *)middleColorWithRatio:(float)ratio {
    CGFloat defaultRValue, defaultGValue, defaultBValue, selectedRValue, selectedGValue, selectedBValue;
    [self.titleDefaultColor getRed:&defaultRValue green:&defaultGValue blue:&defaultBValue alpha:nil];
    [self.titleSelectedColor getRed:&selectedRValue green:&selectedGValue blue:&selectedBValue alpha:nil];
    CGFloat middleRValue = defaultRValue + (selectedRValue - defaultRValue) * ratio;
    CGFloat middleGValue = defaultGValue + (selectedGValue - defaultGValue) * ratio;
    CGFloat middleBValue = defaultBValue + (selectedBValue - defaultBValue) * ratio;
    UIColor *middleColor = [UIColor colorWithRed:middleRValue green:middleGValue blue:middleBValue alpha:1];

    return middleColor;
}

- (void)setConstraints {
    [self.titleContainerView addTopConstraintEqualToView:self];
    [self.titleContainerView addLeadingConstraintEqualToView:self];
    [self.titleContainerView addTrailingConstraintEqualToView:self];
    [self.titleContainerView addHeightConstraint:self.titleContainerViewHeight];
    [self.contentContainerScrollView addConstraintNextToViewVertically:self.titleContainerView];
    [self.contentContainerScrollView addLeadingConstraintEqualToView:self];
    [self.contentContainerScrollView addTrailingConstraintEqualToView:self];
    [self.contentContainerScrollView addBottomConstraintEqualToView:self];
}

- (void)setConstraintsOfTitleButton:(UIButton *)titleButton atIndex:(NSInteger)index withLastTitleButton:(UIButton *)lastTitleButton isFinal:(BOOL)isFianl {
    [titleButton addTopConstraintEqualToView:self.titleContainerView];
    [titleButton addBottomConstraintEqualToView:self.titleContainerView];
    [titleButton addWidthConstraint:[self.titleButtonWidthArray[index] floatValue]];

    if (index == 0) {
        [titleButton addLeadingConstraintEqualToView:self.titleContainerView];
    }

    if (index != 0) {
        [titleButton addConstraintNextToViewHorizontally:lastTitleButton];
        [titleButton addHeightConstraintEqualToView:lastTitleButton];
    }

    if (isFianl) {
        [titleButton addTrailingConstraintEqualToView:self.titleContainerView];
    }
}

- (void)setConstraintsOfContentView:(UIView *)contentView atIndex:(NSInteger)index withLastContentView:(UIView *)lastContentView isFinal:(BOOL)isFianl {
    [contentView addTopConstraintEqualToView:self.contentContainerScrollView];
    [contentView addBottomConstraintEqualToView:self.contentContainerScrollView];
    [contentView addWidthConstraintEqualToView:self.contentContainerScrollView];
    [contentView addHeightConstraintEqualToView:self.contentContainerScrollView];

    if (index == 0) {
        [contentView addLeadingConstraintEqualToView:self.contentContainerScrollView];
    }

    if (index != 0) {
        [contentView addConstraintNextToViewHorizontally:lastContentView];
    }

    if (isFianl) {
        [contentView addTrailingConstraintEqualToView:self.contentContainerScrollView];
    }
}

#pragma mark - getter

- (UIColor *)titleContainerViewColor {
    if (!_titleContainerViewColor) {
        _titleContainerViewColor = [UIColor whiteColor];
    }

    return _titleContainerViewColor;
}

- (UIColor *)titleDefaultColor {
    if (!_titleDefaultColor) {
        _titleDefaultColor = [UIColor B1Color];
    }

    return _titleDefaultColor;
}

- (UIColor *)titleSelectedColor {
    if (!_titleSelectedColor) {
        _titleSelectedColor = [UIColor P3Color];
    }

    return _titleSelectedColor;
}

- (UIColor *)pointerLineViewColor {
    if (!_pointerLineViewColor) {
        _pointerLineViewColor = [UIColor P3Color];
    }

    return _pointerLineViewColor;
}

- (NSInteger)titleContainerViewHeight {
    if (!_titleContainerViewHeight) {
        _titleContainerViewHeight = 35;
    }

    return _titleContainerViewHeight;
}

- (NSInteger)pointerLineViewHeight {
    if (!_pointerLineViewHeight) {
        _pointerLineViewHeight = 3;
    }

    return _pointerLineViewHeight;
}

#pragma mark - Setter

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;

    if (selectedIndex < 0 || selectedIndex >= self.contentContainerScrollView.subviews.count) {
        return;
    }

    // 由于在头部视图的第一个子视图是滑动的条，所以在获取button时要将角标+1
    UIButton *titleButton = self.titleContainerView.subviews[selectedIndex + 1];
    [self didTapTitleButton:titleButton];
}

@end
