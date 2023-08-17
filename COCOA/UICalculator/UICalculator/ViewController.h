//
//  ViewController.h
//  UICalculator
//
//  Created by admin on 5/11/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *number1;
@property (weak) IBOutlet NSTextField *number2;

@property (weak) IBOutlet NSTextField *result;

- (IBAction)add:(id)sender;

@end

