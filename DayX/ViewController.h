//
//  ViewController.h
//  DayX
//
//  Created by Alan Barth on 4/7/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"


@interface ViewController : UIViewController

- (void) updateWithTitle:(NSString *)title body:(NSString *) body;

@property (strong, nonatomic) Entry *entry;


@end

