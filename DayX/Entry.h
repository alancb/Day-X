//
//  Entry.h
//  DayX
//
//  Created by Alan Barth on 4/9/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>

//static NSString *const entryKey = @"entry";
static NSString *const titleKey = @"title";
static NSString *const TimeStampKey = @"timestamp";
static NSString *const bodyTextKey = @"bodytext";


@interface Entry : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *timestamp;

-(NSDictionary *)dictionaryFromEntry;
-(id)initWithDictionary:(NSDictionary *)dictionary;



@end
