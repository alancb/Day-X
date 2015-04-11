//
//  DXEntryController.h
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

+ (EntryController *)sharedInstance;

@property (nonatomic, strong) NSArray *entriesArray;


@end
