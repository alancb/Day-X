//
//  DXListDataSource.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "DXListDataSource.h"
#import "Entry.h"

@implementation DXListDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Entry loadEntriesFromDefaults].count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    
    Entry *entryForCell = [Entry loadEntriesFromDefaults][indexPath.row];
    cell.textLabel.text = entryForCell.title;
    return cell;

}


@end
