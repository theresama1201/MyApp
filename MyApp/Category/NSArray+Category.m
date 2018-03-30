//
//  NSArray+Category.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

- (NSArray*)randomSort {
    NSMutableArray *originArray = [[NSMutableArray alloc]initWithArray:self];
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];

    while (originArray.count != 0) {
        NSUInteger index = arc4random() % originArray.count;
        [resultArray addObject:[originArray objectAtIndex:index]];
        [originArray removeObjectAtIndex:index];
    }

    return resultArray;
}

- (NSArray *)sortCustomObjectByProperty:(NSString *)property isAsc:(BOOL)isAsc {
    NSMutableArray *originArray = [[NSMutableArray alloc] initWithArray:self];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:property ascending:isAsc];
    NSArray *descriptors = [NSArray arrayWithObject:descriptor];
    NSArray *resultArray = [originArray sortedArrayUsingDescriptors:descriptors];

    return resultArray;
}

@end
