//
//  ViewController.h
//  Chat App UDP Teacher
//
//  Created by admin on 6/8/23.
//

#import <Cocoa/Cocoa.h>
#import "ChatController.h"
@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *username;
- (IBAction)loginButtonClicked:(id)sender;


@end

