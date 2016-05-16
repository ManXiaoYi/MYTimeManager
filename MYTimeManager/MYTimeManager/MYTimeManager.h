//
//  MYTimeManager.h
//  MYTimeManager
//
//  Created by 满孝意 on 16/5/13.
//  Copyright © 2016年 满孝意. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYTimeManager : NSObject

/**
 * 获取 [ 年、月、日、周 ] 数组
 */
+ (NSArray *)timeOFDate;

/**
 *  获取 [ 本年初、末 ] 数组
 */
+ (NSArray *)timeOFStartAndEndForYear;

/**
 *  获取 [ 本月初、末 ] 数组
 */
+ (NSArray *)timeOFStartAndEndForMonth;

/**
 *  获取 [ 本日初、末 ] 数组
 */
+ (NSArray *)timeOFStartAndEndForDay;

/**
 *  获取 [ 周一、今天 ] 数组
 */
+ (NSArray *)timeOFMondayToToday;

/**
 *  获取 [ N天前、今天 ] 数组
 */
+ (NSArray *)timeOFOtherDayToToday:(NSInteger)count;

/**
 *  获取 [ 初始、结束(时间戳) ] 数组
 */
+ (NSArray *)timeStampOFStartAndEnd:(NSArray *)timeArray;

/**
 *  时间 - > 时间戳
 */
+ (NSString *)transTimeStampToTime:(NSString *)time type:(NSString *)timeType;

/**
 *  时间戳 - > 时间
 */
+ (NSString *)transTimeToTimeStamp:(NSString *)timeStamp type:(NSString *)timeType;

@end
