//
//  ViewController.h
//  FullCalculator
//
//  Created by admin on 5/25/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
//Declaring the outlet as result
@property (weak) IBOutlet NSTextField *displayLabel;

//Declaring the actions
- (IBAction)numberButtonTapped:(id)sender;
- (IBAction)operationButtonTapped:(id)sender;
- (IBAction)doNil:(id)sender;

//Declaring the dark and light themes
- (IBAction)darkTheme:(id)sender;
- (IBAction)lightTheme:(id)sender;


//Declaring strong variables for calculation
@property (nonatomic, strong) NSMutableString *inputString;
@property (nonatomic, assign) double result;
@property (nonatomic, assign) BOOL isTypingNumber;
@property (nonatomic, assign) NSString *operation;
//@property (nonatomic, assign) NSMutableString *fullString;
//@property (nonatomic, assign) NSString *fullStringNew;
@end

