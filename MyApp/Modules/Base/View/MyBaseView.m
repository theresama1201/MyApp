//
//  MyBaseView.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/23.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyBaseView.h"

@implementation MyBaseView

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

- (void)initialize {}

@end
