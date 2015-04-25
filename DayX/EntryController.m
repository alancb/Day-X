//
//  DXEntryController.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "EntryController.h"
static NSString *const AllEntriesKey = @"all entries";

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

- (Entry *) createEntryWithTitle: (NSString *)title bodyText: (NSString *) bodyText {
    Entry *entry = [Entry new];
    entry.title = title;
    entry.body = bodyText;
    entry.timestamp = [NSDate date];
    
    [self addEntry:entry];
    
    return entry;
}

- (void) addEntry: (Entry *) entry {
    if (!entry) {
        return;
    }
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
    NSMutableArray *mutableEntry = [self.entriesArray mutableCopy];
    if ([mutableEntry containsObject:oldEntry]) {
        NSInteger index = [mutableEntry indexOfObject: oldEntry];
        [mutableEntry replaceObjectAtIndex:index withObject:newEntry];
        
        self.entriesArray = mutableEntry;
        [self synchronize];
    }
}

- (void) loadEntriesFromDefaults {
    NSArray *allEntries = [[NSUserDefaults standardUserDefaults] objectForKey:AllEntriesKey];
    self.entriesArray = allEntries;
    
    NSMutableArray *entriesArray = [NSMutableArray new];
    
    for (NSDictionary *dictionary in allEntries) {
        [entriesArray addObject:[[Entry alloc] initWithDictionary:dictionary]];
    }
    self.entriesArray = entriesArray;
}

//- (void)loadFromPersistentStorage {
//    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:AllEntriesKey];
//    self.entries = entryDictionaries;
//    
//    NSMutableArray *entries = [NSMutableArray new];
//    for (NSDictionary *entry in entryDictionaries) {
//        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
//    }
//    
//    self.entries = entries;
//}

- (void) synchronize {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entriesArray) {
        [entryDictionaries addObject:[entry dictionaryFromEntry]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:AllEntriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];     
    
}

- (void) save {
    [self synchronize];
}



@end
