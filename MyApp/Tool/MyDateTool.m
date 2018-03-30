//
//  MyDateTool.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyDateTool.h"

@implementation MyDateTool

#pragma mark - Public

+ (NSDate *)localizedMidnightDateOfDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self dateFormatter];
    NSDateFormatter *dateTimeFormatter = [self dateTimeFormatter];

    NSString *midnightDateString = [NSString stringWithFormat:@"%@ 00:00:00", [dateFormatter stringFromDate:date]];
    NSDate *midnightDate = [dateTimeFormatter dateFromString:midnightDateString];

    return midnightDate;
}

+ (NSString *)dateStringFromISO8601DateString:(NSString *)ISO8601DateString {
    NSDateFormatter *ISO8601DateFormatter = [self ISO8601DateFormatter];
    NSDateFormatter *dateFormatter = [self dateFormatter];

    NSDate *date = [ISO8601DateFormatter dateFromString:ISO8601DateString];
    NSString *dateString = [dateFormatter stringFromDate:date];

    return dateString;
}

+ (NSString *)ISO8601DateStringFromDate:(NSDate *)date {
    NSDateFormatter *ISO8601DateFormatter = [self ISO8601DateFormatter];
    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:date];

    return ISO8601DateString;
}

+ (NSString *)ISO8601DateStringFromDateString:(NSString *)dateString {
    NSDateFormatter *ISO8601DateFormatter = [self ISO8601DateFormatter];
    NSDateFormatter *dateFormatter = [self dateFormatter];

    NSDate *date = [dateFormatter dateFromString:dateString];
    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:date];

    return ISO8601DateString;
}

+ (NSString *)ISO8601DateStringFromDateTimeString:(NSString *)dateTimeString {
    NSDateFormatter *ISO8601DateFormatter = [self ISO8601DateFormatter];
    NSDateFormatter *dateTimeFormatter = [self dateTimeFormatter];

    NSDate *date = [dateTimeFormatter dateFromString:dateTimeString];
    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:date];

    return ISO8601DateString;
}

+ (NSDate *)dateFromISO8601DateString:(NSString *)ISO8601DateString {
    NSDateFormatter *dateFormatter = [self ISO8601DateFormatter];

    return [dateFormatter dateFromString:ISO8601DateString];
}

+ (NSDate *)dateFromDateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [self dateFormatter];

    return [dateFormatter dateFromString:dateString];
}

+ (NSDate *)dateFromDateTimeString:(NSString *)dateTimeString {
    NSDateFormatter *dateTimeFormatter = [self dateTimeFormatter];

    return [dateTimeFormatter dateFromString:dateTimeString];
}

+ (NSString *)dateStringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self dateFormatter];

    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dateTimeStringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self dateTimeFormatter];

    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dateTimeStringFromISO8601DateString:(NSString *)ISO8601DateString {
    NSDateFormatter *ISO8601DateFormatter = [self ISO8601DateFormatter];
    NSDateFormatter *dateTimeFormatter = [self dateTimeFormatter];

    NSDate *date = [ISO8601DateFormatter dateFromString:ISO8601DateString];
    NSString *dateTimeString = [dateTimeFormatter stringFromDate:date];

    return dateTimeString;
}

+ (NSString *)dateTimeNoSecondStringFromISO8601DateString:(NSString *)ISO8601DateString {
    NSDateFormatter *ISO8601DateFormatter = [self ISO8601DateFormatter];
    NSDateFormatter *dateTimeNoSecondFormatter = [self dateTimeNoSecondFormatter];

    NSDate *date = [ISO8601DateFormatter dateFromString:ISO8601DateString];
    NSString *dateTimeString = [dateTimeNoSecondFormatter stringFromDate:date];

    return dateTimeString;
}

+ (NSString *)dateTimeNoSecondStringFromDate:(NSDate *)date {
    NSDateFormatter *dateTimeNoSecondFormatter = [self dateTimeNoSecondFormatter];
    NSString *dateTimeString = [dateTimeNoSecondFormatter stringFromDate:date];

    return dateTimeString;
}

+ (BOOL)isStartOfDayInEasternEightTimeZoneForDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self timeFormatter];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSString *dateString = [dateFormatter stringFromDate:date];

    return [@"00:00:00" isEqualToString:dateString];
}

+ (BOOL)isEndOfDayInEasternEightTimeZoneForDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self timeFormatter];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSString *dateString = [dateFormatter stringFromDate:date];

    return [@"23:59:59" isEqualToString:dateString];
}

+ (BOOL)isDateInToday:(NSDate *)date {
    NSDateFormatter *dateFormatter = [self dateFormatter];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSString *todayDateString = [dateFormatter stringFromDate:[NSDate date]];

    return [todayDateString isEqualToString:dateString];
}

+ (BOOL)isGreaterOrEqual:(NSDate *)oneDate another:(NSDate *)anotherDate {
    NSString *oneDateStr = [self dateStringFromDate:oneDate];
    NSString *anotherDateStr = [self dateStringFromDate:anotherDate];;
    NSDate *newOneDate = [self dateFromDateString:oneDateStr];
    NSDate *newAnotherDate = [self dateFromDateString:anotherDateStr];
    NSComparisonResult result = [newOneDate compare:newAnotherDate];

    if (result == NSOrderedDescending || result == NSOrderedSame) {
        return YES;
    }

    return NO;
}

+ (BOOL)isGreater:(NSDate *)oneDate another:(NSDate *)anotherDate {
    NSString *oneDateStr = [self dateStringFromDate:oneDate];
    NSString *anotherDateStr = [self dateStringFromDate:anotherDate];;
    NSDate *newOneDate = [self dateFromDateString:oneDateStr];
    NSDate *newAnotherDate = [self dateFromDateString:anotherDateStr];
    NSComparisonResult result = [newOneDate compare:newAnotherDate];

    if (result == NSOrderedDescending) {
        return YES;
    }

    return NO;
}

+ (BOOL)isLesser:(NSDate *)oneDate another:(NSDate *)anotherDate {
    NSString *oneDateStr = [self dateStringFromDate:oneDate];
    NSString *anotherDateStr = [self dateStringFromDate:anotherDate];;
    NSDate *newOneDate = [self dateFromDateString:oneDateStr];
    NSDate *newAnotherDate = [self dateFromDateString:anotherDateStr];
    NSComparisonResult result = [newOneDate compare:newAnotherDate];

    if (result == NSOrderedAscending) {
        return YES;
    }

    return NO;
}

+ (BOOL)isEqual:(NSDate *)oneDate another:(NSDate *)anotherDate {
    NSString *oneDateStr = [self dateStringFromDate:oneDate];
    NSString *anotherDateStr = [self dateStringFromDate:anotherDate];;
    NSDate *newOneDate = [self dateFromDateString:oneDateStr];
    NSDate *newAnotherDate = [self dateFromDateString:anotherDateStr];
    NSComparisonResult result = [newOneDate compare:newAnotherDate];

    if (result == NSOrderedSame) {
        return YES;
    }

    return NO;
}

+ (NSTimeInterval)restSeconds:(NSDate *)oneDate another:(NSDate *)anotherDate {
    return [oneDate timeIntervalSinceDate:anotherDate];
}

+ (int)daysToTodayFormDate:(NSDate *)date {
    NSString *dateString = [MyDateTool dateStringFromDate:date];
    NSString *todayString = [MyDateTool dateStringFromDate:[NSDate date]];
    NSDate *formatDate = [MyDateTool dateFromDateString:dateString];
    NSDate *todayDate = [MyDateTool dateFromDateString:todayString];
    NSInteger restSeconds = [MyDateTool restSeconds:formatDate another:todayDate];

    return abs(((int)restSeconds) / (3600*24));
}

#pragma mark - Private

+ (NSDateFormatter *)ISO8601DateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    return dateFormatter;
}

+ (NSDateFormatter *)dateTimeFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    return dateFormatter;
}

+ (NSDateFormatter *)timeFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm:ss";

    return dateFormatter;
}

+ (NSDateFormatter *)dateTimeNoSecondFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    return dateFormatter;
}

@end
