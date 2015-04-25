//
//  Car.m
//  DayX
//
//  Created by Alan Barth on 4/9/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "Car.h"

@implementation Car
- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if (self) {
        self.model = dictionary[ModelKey];
        self.year = dictionary[YearKey];
        self.make = dictionary [MakeKey];
    }
    return self;
}
@end
