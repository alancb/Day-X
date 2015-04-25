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
- (void) replaceEntry: (Entry *) oldEntry WithNewEntry:(Entry *) newEntry;
- (void) removeEntry: (Entry *) entry;
- (void) addEntry: (Entry *) entry;

@property (nonatomic, strong) NSArray *entriesArray;

- (void) loadEntriesFromDefaults;
- (void) save;
- (Entry *) createEntryWithTitle: (NSString *)title bodyText: (NSString *) bodyText;


@end
