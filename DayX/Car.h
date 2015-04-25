//
//  Car.h
//  DayX
//
//  Created by Alan Barth on 4/9/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const YearKey = @"year";
static NSString *const MakeKey = @"make";
static NSString *const ModelKey = @"model";


@interface Car : NSObject

@property (strong, nonatomic) NSString * year;
@property (strong, nonatomic) NSString * make;
@property (strong, nonatomic) NSString * model;

@end
