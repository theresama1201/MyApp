//
//  MyBaseWithNibView.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/30.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyBaseWithNibView.h"
#import "UIView+Constraint.h"

@implementation MyBaseWithNibView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeContentView];
        [self initialize];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeContentView];
        [self initialize];
    }

    return self;
}

- (void)initializeContentView {
    NSArray *viewArray = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];

    if (viewArray.firstObject) {
        UIView *contentView = viewArray.firstObject;
        [self addSubview:contentView];
        contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [contentView addEdgesConstraintsEqualToView:self];
    }
}

- (void)initialize {}

@end
