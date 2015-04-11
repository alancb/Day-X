//
//  ViewController.m
//  DayX
//
//  Created by Alan Barth on 4/7/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "ViewController.h"
#import "Entry.h"



@interface ViewController () <UITextViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *otherText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    self.otherText.delegate = self;
    
    NSDictionary *entry = [[NSUserDefaults standardUserDefaults] objectForKey:entryKey];
    [self updateViewWithDictionary:entry];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)updateWithTitle:(NSString *)title body:(NSString *)body {
    self.textField.text = title;
    self.otherText.text = body;
}

- (IBAction)save:(id)sender {
    if (self.entry == nil) {
        self.entry = [[Entry alloc]init];
        self.entry.title = self.otherText.text;
        self.entry.body = self.textField.text;
    }
    
    NSMutableArray *entries = [Entry loadEntriesFromDefaults];
    [entries addObject:self.entry];
    [Entry storeEntriesInDefaults:entries];
    
    //[NSDate date]
    NSDictionary *entry = @{titleKey:self.textField.text, bodyTextKey:self.otherText.text}; //change to entry
    [[NSUserDefaults standardUserDefaults] setObject:entry forKey:entryKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    // add array with entry getting the new entries, then store in defaults
}

- (void) updateViewWithDictionary: (NSDictionary *) dictionary // change to entry
{
    self.textField.text = dictionary[titleKey]; //change to entry.title = text
    self.otherText.text = dictionary[bodyTextKey];
}

- (IBAction)buttonTapped:(id)sender {
    self.textField.text = @"";
    self.otherText.text = @"";
    
}

#pragma mark - TextView delegate methods.

- (void)textViewDidChange:(UITextView *)textView {
    [self save:self.textField];
}

#pragma mark - TextField delegate methods

- (void)textFieldDidEndEditing:(UITextView *)textView {
    [self save:self.textField];
}


- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
