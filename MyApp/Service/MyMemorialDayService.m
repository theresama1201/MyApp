//
//  MyMemorialDayService.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyMemorialDayService.h"
#import "MyMemorialDayModel.h"

static NSString *const originFilePathPrefix = @"memorialDay";
static NSString *const newFilePath = @"memorialDay.plist";

@implementation MyMemorialDayService

#pragma mark - init

+ (instancetype)sharedInstance {
    static MyMemorialDayService *sharedService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });

    return sharedService;
}

#pragma mark - Public

- (NSArray *)memorialDayList {
    NSMutableArray *contentList = [self fileContentArray];
    NSMutableArray *memorialDayList = [NSMutableArray array];

    [contentList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj[@"isDelete"] boolValue]) {
            MyMemorialDayModel *memorialDayModel = [[MyMemorialDayModel alloc] initWithDictionary:obj];
            [memorialDayList addObject:memorialDayModel];
        }
    }];

    return memorialDayList;
}

- (void)addOneMemorialDay:(MyMemorialDayModel *)memorialDayModel {
    NSMutableArray *memorialDayList = [self fileContentArray];
    NSMutableDictionary *memorialDayDic = [NSMutableDictionary dictionary];
    memorialDayDic[@"ID"] = [@"memorialDay" stringByAppendingString:[NSString stringWithFormat:@"%lu", memorialDayList.count]];
    memorialDayDic[@"name"] = memorialDayModel.name;
    memorialDayDic[@"startDate"] = memorialDayModel.startDate;
    memorialDayDic[@"isDelete"] = @(0);
    [memorialDayList addObject:memorialDayDic];
    [memorialDayList writeToFile:[self filePath] atomically:YES];
}

- (void)modifyMemorialDay:(MyMemorialDayModel *)memorialDayModel {
    NSMutableArray *contentList = [self fileContentArray];

    [contentList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj[@"ID"] isEqualToString:memorialDayModel.ID]) {
            obj[@"name"] = memorialDayModel.name;
            obj[@"startDate"] = memorialDayModel.startDate;
        }
    }];

    [contentList writeToFile:[self filePath] atomically:YES];
}

- (void)deleteOneMemorialDay:(NSString *)memorialDayId {
     NSMutableArray *contentList = [self fileContentArray];

    [contentList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj[@"ID"] isEqualToString:memorialDayId]) {
            obj[@"isDelete"] = @(1);
        }
    }];

    [contentList writeToFile:[self filePath] atomically:YES];
}

#pragma mark - Private

- (NSMutableArray *)fileContentArray {
    NSString *filePath = [self filePath];
    NSMutableArray *fileContentArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];

    if (!fileContentArray || fileContentArray.count == 0) {
        NSString *originFilePath = [self originFilePath];
        NSMutableArray *originfileContentArray = [[NSMutableArray alloc] initWithContentsOfFile:originFilePath];
        [originfileContentArray writeToFile:[self filePath] atomically:YES];
        fileContentArray = [[NSMutableArray alloc] initWithContentsOfFile:originFilePath];
    }

    return fileContentArray;
}

- (NSString *)originFilePath {
     return [[NSBundle mainBundle] pathForResource:originFilePathPrefix ofType:@"plist"];
}

- (NSString *)filePath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];

    return [path stringByAppendingPathComponent:newFilePath];
}

@end
