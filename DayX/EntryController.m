//
//  DXEntryController.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
 
        [sharedInstance loadEntriesFromDefaults];
    });
    return sharedInstance;
}

- (void) addEntry: (Entry *) entry {
    NSMutableArray *mutableEntry = [[NSMutableArray alloc] initWithArray:self.entriesArray];
    [mutableEntry addObject:entry];
    
    self.entriesArray = mutableEntry;
    [self synchronize];
}

- (void) removeEntry: (Entry *) entry {
    NSMutableArray *mutableEntry = [[NSMutableArray alloc] initWithArray:self.entriesArray];
    [mutableEntry removeObject:entry];
    
    self.entriesArray = mutableEntry;
    [self synchronize];
}

- (void) replaceEntry: (Entry *) oldEntry WithNewEntry:(Entry *) newEntry {
    NSMutableArray *mutableEntry = self.entriesArray.mutableCopy;
    if ([mutableEntry containsObject:oldEntry]) {
        NSInteger index = [mutableEntry indexOfObject: oldEntry];
        [mutableEntry replaceObjectAtIndex:index withObject:newEntry];
        
        self.entriesArray = mutableEntry;
        [self synchronize];
    }
}

- (void) loadEntriesFromDefaults {
    NSArray *allEntries = [[NSUserDefaults standardUserDefaults] objectForKey:AllEntriesKey];
    
    NSMutableArray *entriesArray = [NSMutableArray new];
    
    for (NSDictionary *dictionary in allEntries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [entriesArray addObject:entry];
    }
    self.entriesArray = entriesArray;
}

- (void) synchronize {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entriesArray) {
        [entryDictionaries addObject:[entry dictionaryFromEntry]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryKey];
    [[NSUserDefaults standardUserDefaults] synchronize];     
    
}



@end
