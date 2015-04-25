//
//  ViewController.m
//  DayX
//
//  Created by Alan Barth on 4/7/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "ViewController.h"
#import "EntryController.h"

@interface ViewController () <UITextViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *otherText;

@end

@implementation ViewController

//- (void) updateWithEntry: (Entry *) entry {
//    self.entry = entry;
//    self.textField.text = entry.title;
//    self.otherText.text = entry.body;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.textField.delegate = self;
//    self.otherText.delegate = self;
//    
//    self.textField.text = self.entry.title;
//    self.otherText.text = self.entry.body;
    [self updateWithEntry:self.entry];
    
  
}

-(void)updateWithEntry: (Entry *) entry {
    self.entry = entry;
    self.otherText.text = entry.title;
    self.textField.text = entry.body;
}

- (IBAction)save:(id)sender {
//    Entry *entry = [[Entry alloc] initWithDictionary:@{ titleKey:self.textField.text, bodyTextKey:self.otherText.text}];
//    
//    if (!self.entry) {
//        [[EntryController sharedInstance] addEntry:entry];
//    }
//    else {
//        [[EntryController sharedInstance] replaceEntry:self.entry WithNewEntry:entry];
//    }
    if (self.entry) {
        self.entry.title = self.otherText.text;
        self.entry.body = self.textField.text;
        self.entry.timestamp = [NSDate date];
        
        [[EntryController sharedInstance] save];
    } else {
        self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.otherText.text bodyText:self.textField.text];
    }
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
}

#pragma mark - TextField delegate methods

- (void)textFieldDidEndEditing:(UITextView *)textView {
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
