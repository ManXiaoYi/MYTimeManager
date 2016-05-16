//
//  ViewController.m
//  MYTimeManager
//
//  Created by 满孝意 on 16/5/13.
//  Copyright © 2016年 满孝意. All rights reserved.
//

#import "ViewController.h"
#import "MYTimeManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"----- %@", [MYTimeManager timeOFDate]);
    NSLog(@"----- %@", [MYTimeManager timeOFStartAndEndForYear]);
    NSLog(@"----- %@", [MYTimeManager timeOFStartAndEndForMonth]);
    NSLog(@"----- %@", [MYTimeManager timeOFStartAndEndForDay]);
    NSLog(@"----- %@", [MYTimeManager timeOFMondayToToday]);
    NSLog(@"----- %@", [MYTimeManager timeOFOtherDayToToday:3]);
    NSLog(@"----- %@", [MYTimeManager timeStampOFStartAndEnd:[MYTimeManager timeOFStartAndEndForYear]]);
    
    NSLog(@"----- %@", [MYTimeManager transTimeStampToTime:@"2016-05-01" type:@"yyyy-MM-dd"]);
    NSLog(@"----- %@", [MYTimeManager transTimeToTimeStamp:@"1462032000" type:@"yyyy-MM-dd"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
