//
//  ViewController.h
//  ChatBoxWthNSPasteboard
//
//  Created by admin on 05/06/23.


#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextFieldCell *textField;

-(IBAction)sendMessage:(id)sender;


@end

