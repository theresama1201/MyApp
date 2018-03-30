//
//  MyDateTool.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDateTool : NSObject

+ (NSDate *)localizedMidnightDateOfDate:(NSDate *)date;
+ (NSString *)dateStringFromISO8601DateString:(NSString *)ISO8601DateString;
+ (NSString *)ISO8601DateStringFromDate:(NSDate *)date;
+ (NSString *)ISO8601DateStringFromDateString:(NSString *)dateString;
+ (NSString *)ISO8601DateStringFromDateTimeString:(NSString *)dateTimeString;
+ (NSDate *)dateFromISO8601DateString:(NSString *)ISO8601DateString;
+ (NSDate *)dateFromDateString:(NSString *)dateString;
+ (NSDate *)dateFromDateTimeString:(NSString *)dateTimeString;
+ (NSString *)dateStringFromDate:(NSDate *)date;
+ (NSString *)dateTimeStringFromDate:(NSDate *)date;
+ (NSString *)dateTimeStringFromISO8601DateString:(NSString *)ISO8601DateString;
+ (NSString *)dateTimeNoSecondStringFromISO8601DateString:(NSString *)ISO8601DateString;
+ (NSString *)dateTimeNoSecondStringFromDate:(NSDate *)date;
+ (BOOL)isStartOfDayInEasternEightTimeZoneForDate:(NSDate *)date;
+ (BOOL)isEndOfDayInEasternEightTimeZoneForDate:(NSDate *)date;
+ (BOOL)isDateInToday:(NSDate *)date;
+ (BOOL)isGreater:(NSDate *)oneDate another:(NSDate *)anotherDate;  // 如果oneDate大于anotherDate，返回YES
+ (BOOL)isLesser:(NSDate *)oneDate another:(NSDate *)anotherDate;   // 如果oneDate小于anotherDate，返回YES
+ (BOOL)isEqual:(NSDate *)oneDate another:(NSDate *)anotherDate;    // 如果oneDate等于anotherDate，返回YES
+ (NSTimeInterval)restSeconds:(NSDate *)oneDate another:(NSDate *)anotherDate;   // 如果oneDate-anotherDate的时间差
+ (int)daysToTodayFormDate:(NSDate *)date; //从一个日期到今天为止相隔了多少天
@end
