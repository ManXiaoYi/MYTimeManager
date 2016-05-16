//
//  MYTimeManager.m
//  MYTimeManager
//
//  Created by 满孝意 on 16/5/13.
//  Copyright © 2016年 满孝意. All rights reserved.
//

#import "MYTimeManager.h"

@implementation MYTimeManager

#pragma mark -
#pragma mark - 获取 [ 年、月、日、周 ] 数组
+ (NSArray *)timeOFDate {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:[NSDate date]];
    
    NSString *yearStr = [NSString stringWithFormat:@"%ld", (long)[components year]];
    NSString *monthStr = [NSString stringWithFormat:@"%.2ld", (long)[components month]];
    NSString *dayStr = [NSString stringWithFormat:@"%.2ld", (long)[components day]];
    NSString *weekStr = [NSString stringWithFormat:@"%ld", (long)[components weekday] - 1];
    
    return [NSArray arrayWithObjects:yearStr, monthStr, dayStr, weekStr, nil];
}

#pragma mark -
#pragma mark - 获取 [ 本年初、末 ] 数组
+ (NSArray *)timeOFStartAndEndForYear {
    
    NSArray *timeArray = [self timeOFDate];
    
    NSString *startTime = [NSString stringWithFormat:@"%@-01-01", timeArray[0]];
    NSString *endTime = [NSString stringWithFormat:@"%@-12-31", timeArray[0]];
    
    return [NSArray arrayWithObjects:startTime, endTime, nil];
}

#pragma mark -
#pragma mark - 获取 [ 本月初、末 ] 数组
+ (NSArray *)timeOFStartAndEndForMonth {
    
    NSArray *timeArray = [self timeOFDate];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    
    NSString *startTime = [NSString stringWithFormat:@"%@-%@-01", timeArray[0], timeArray[1]];
    NSString *endTime = [NSString stringWithFormat:@"%@-%@-%ld", timeArray[0], timeArray[1], (unsigned long)numberOfDaysInMonth];
    
    return [NSArray arrayWithObjects:startTime, endTime, nil];
}

#pragma mark -
#pragma mark - 获取 [ 本日初、末 ] 数组
+ (NSArray *)timeOFStartAndEndForDay {
    
    NSArray *timeArray = [self timeOFDate];
    
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@", timeArray[0], timeArray[1], timeArray[2]];
    
    return [NSArray arrayWithObjects:dateStr, dateStr, nil];
}

#pragma mark -
#pragma mark - 获取 [ 周一、今天 ] 数组
+ (NSArray *)timeOFMondayToToday {
    
    NSArray *timeArray = [self timeOFDate];
    
    NSInteger weekday = [timeArray[3] integerValue];
    
    return [self timeOFOtherDayToToday:weekday - 1];
}

#pragma mark -
#pragma mark - 获取 [ N天前、今天 ] 数组
+ (NSArray *)timeOFOtherDayToToday:(NSInteger)count {
    
    NSInteger timeInterval = (count - 1) * 24 * 60 * 60;
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSInteger newTime = now - timeInterval;
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:newTime];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *beforeDateStr = [formatter stringFromDate:newDate];
    
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    
    return [NSArray arrayWithObjects:beforeDateStr, dateStr, nil];
}

#pragma mark -
#pragma mark - 获取 [ 初始、结束(时间戳) ] 数组
+ (NSArray *)timeStampOFStartAndEnd:(NSArray *)timeArray {
    
    NSString *begainTime = [NSString stringWithFormat:@"%@ 00:00:00", timeArray[0]];
    NSString *endTime = [NSString stringWithFormat:@"%@ 23:59:59", timeArray[1]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *begainDate = [dateFormatter dateFromString:begainTime];
    NSString *filterOfTimeBegain = [NSString stringWithFormat:@"%ld", (long)[begainDate timeIntervalSince1970]];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSString *filterOfTimeEnd = [NSString stringWithFormat:@"%ld", (long)[endDate timeIntervalSince1970]];
    
    return [NSArray arrayWithObjects:filterOfTimeBegain, filterOfTimeEnd, nil];
}

#pragma mark -
#pragma mark - 时间 - > 时间戳
+ (NSString *)transTimeStampToTime:(NSString *)time type:(NSString *)timeType {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:timeType];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[formatter dateFromString:time] timeIntervalSince1970]];
    
    return timeSp;
}

#pragma mark -
#pragma mark - 时间戳 - > 时间
+ (NSString *)transTimeToTimeStamp:(NSString *)timeStamp type:(NSString *)timeType {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:timeType];
    NSString *strDate = [NSString stringWithFormat:@"%@", [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[timeStamp integerValue]]]];
    
    return strDate;
}

@end
