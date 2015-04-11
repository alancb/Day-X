//
//  DXListViewController.m
//  DayX
//
//  Created by Alan Barth on 4/11/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "DXListViewController.h"

@implementation DXListViewController

- (IBAction)addEntry:(id)sender {
    [self performSegueWithIdentifier:@"rowSelected" sender:self];
}

@end
