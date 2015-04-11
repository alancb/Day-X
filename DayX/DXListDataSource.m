//
//  DXListDataSource.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "DXListDataSource.h"
#import "EntryController.h"

@implementation DXListDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedInstance].entriesArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    
    Entry *entry = [EntryController sharedInstance].entriesArray[indexPath.row];
    cell.textLabel.text = entry.title;
    return cell;

}


@end
