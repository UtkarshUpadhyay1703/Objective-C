//
//  ViewController.h
//  TryUI
//
//  Created by admin on 5/24/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
//Declaring the outlet as result
@property (weak) IBOutlet NSTextField *displayLabel;

//Declaring the actions
- (IBAction)numberButtonTapped:(id)sender;
- (IBAction)operationButtonTapped:(id)sender;
- (IBAction)doNil:(id)sender;

//Declaring strong variables for calculation
@property (nonatomic, strong) NSMutableString *inputString;
@property (nonatomic, assign) double result;
@property (nonatomic, assign) BOOL isTypingNumber;
@property (nonatomic, assign) NSString *operation;
@end

