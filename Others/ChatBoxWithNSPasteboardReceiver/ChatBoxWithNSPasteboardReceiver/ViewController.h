//
//  ViewController.h
//  ChatBoxWithNSPasteboardReceiver
//
//  Created by admin on 05/06/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

//@property (weak) IBOutlet NSScrollView *textView;

@property (unsafe_unretained) IBOutlet NSTextView *textView;
//
//@property NSMutableString * messageString;
//@property NSMutableString * oldmessage;
//-(IBAction)readMessage:(id)sender;
//@property (nonatomic, strong) NSPasteboard *pasteboard;
//@property (nonatomic, copy) NSString *oldPasteboardString;
//- (void)startPasteboardMonitoring;




- (void)handleReceivedMessage:(NSNotification *)notification;
- (void)startDistributedNotifications;


@end

