//
//  ViewController.h
//  Different Field Usage
//
//  Created by admin on 5/5/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTokenField *tokenField;

@property (weak) IBOutlet NSDatePicker *TodaysDate;
@property (weak) IBOutlet NSTextField *numberLabel;

@property (weak) IBOutlet NSTextField *showDate;

- (IBAction)pressToShowDate:(id)sender;


- (IBAction)Check:(id)sender;
- (IBAction)tokenCheck:(id)sender;

@end

