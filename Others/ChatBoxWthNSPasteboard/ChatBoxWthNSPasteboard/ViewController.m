//
//  ViewController.m
//  ChatBoxWthNSPasteboard
//
//  Created by admin on 05/06/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)sendMessage:(id)sender {
//    NSPasteboard * pasteBoard = [NSPasteboard generalPasteboard];
//    NSString * message = self.textField.stringValue;
//
//    [pasteBoard clearContents];
//    [pasteBoard writeObjects:@[message]];
//
//    [self.textField setStringValue:@""];
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"MessageSentNotification" object:nil];
    
    NSString *message = self.textField.stringValue;
       
       [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"ChatMessageNotification"
                                                                      object:nil
                                                                    userInfo:@{@"message": message}
                                                          deliverImmediately:YES];
       
       [self.textField setStringValue:@""];
    }
@end
