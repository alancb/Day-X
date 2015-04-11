//
//  DXListViewController.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "DXListViewController.h"
#import "DXListDataSource.h"

@interface DXListViewController ()
@property (nonatomic, strong)DXListDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DXListViewController


- (void)viewDidLoad {
    self.dataSource = [DXListDataSource new];
    
    
}

- (IBAction)addEntry:(id)sender {
    [self performSegueWithIdentifier:@"rowSelected" sender:self];
}

@end
