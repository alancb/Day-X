//
//  DXListViewController.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "DXListViewController.h"
#import "DXListDataSource.h"
#import "ViewController.h"
#import "EntryController.h"

@interface DXListViewController ()
@property (nonatomic, strong)DXListDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DXListViewController


- (void)viewDidLoad {
    self.dataSource = [DXListDataSource new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"rowSelected" sender:self]; //]updateWithEntry:[EntryController sharedInstance].entriesArray[indexPath.row]];
    
}

- (IBAction)addEntry:(id)sender {
    [self performSegueWithIdentifier:@"rowSelected" sender:self];
}

@end
