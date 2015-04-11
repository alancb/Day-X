//
//  Entry.m
//  DayX
//
//  Created by Alan Barth on 4/9/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "Entry.h"

@implementation Entry



- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey ];
        self.body = dictionary [bodyTextKey];
        self.timestamp = dictionary[TimeStampKey];
    
    }
    return self;
}

- (NSDictionary *) dictionaryFromEntry {
//    NSDictionary *dictionary = @{
//                                 titleKey : self.title,
//                                 bodyTextKey : self.body,
//                                 TimeStampKey : self.timestamp
//                                 };
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title ){
        [entryDictionary setObject:self.title forKey:titleKey];
    }
    if (self.body) {
        [entryDictionary setObject:self.body forKey:bodyTextKey];
    }
    if (self.timestamp) {
        [entryDictionary setObject:self.timestamp forKey:TimeStampKey];
    }
    return entryDictionary;
                                
}

+ (NSMutableArray *) loadEntriesFromDefaults {
   NSArray *allEntries = [[NSUserDefaults standardUserDefaults] objectForKey:AllEntriesKey];
    
    NSMutableArray *entriesArray = [NSMutableArray new];
    
    for (NSDictionary *dictionary in allEntries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [entriesArray addObject:entry];
    }
    return entriesArray;
}

+ (void) storeEntriesInDefaults: (NSArray *) entries {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in entries) {
        [entryDictionaries addObject:[entry dictionaryFromEntry]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryKey];
    [[NSUserDefaults standardUserDefaults] synchronize]; // the solution doesn't have this. Why?

    
}

@end
