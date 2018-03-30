//
//  NSArray+Category.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

// 随机排序
- (NSArray*)randomSort;
// 根据自定义对象的属性为数组中的对象排序
- (NSArray *)sortCustomObjectByProperty:(NSString *)property isAsc:(BOOL)isAsc;

@end
