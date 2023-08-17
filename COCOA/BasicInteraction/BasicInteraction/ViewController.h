//
//  ViewController.h
//  BasicInteraction
//
//  Created by admin on 5/4/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
- (IBAction) changeLabel:(id)sender;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *myLabel;

@end

