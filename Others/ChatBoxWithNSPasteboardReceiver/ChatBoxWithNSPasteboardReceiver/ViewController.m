//////
//////  ViewController.m
//////  ChatBoxWithNSPasteboardReceiver
//////
//////  Created by admin on 05/06/23.
//////
////
////#import "ViewController.h"
////
////@implementation ViewController
////
////- (void)viewDidLoad {
////    [super viewDidLoad];
////
////    self.messageString = [NSMutableString stringWithString:@""];
////
////    // Register for pasteboard change notification
////       [[NSNotificationCenter defaultCenter] addObserver:self
////                                                selector:@selector(pasteboardChanged:)
////                                                    name:NSPasteboardDidChangeNotification
////                                                  object:nil];
////}
////
////- (NSString *)readFromPasteboard {
////    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
////
////    // Check if the pasteboard has string data
////    if ([[pasteboard types] containsObject:NSPasteboardTypeString]) {
////        NSString *copiedText = [pasteboard stringForType:NSPasteboardTypeString];
////        return copiedText;
////    }
////
////    return @"nothing to copy"; // No string data found on the pasteboard
////}
////
////- (IBAction)readMessage:(id)sender {
////
////
////    [self.messageString appendString:[self readFromPasteboard]];
////
////    self.textView.string = self.messageString;
////}
////- (void)pasteboardChanged:(NSNotification *)notification {
////    // Call the readMessage method whenever the pasteboard changes
////    [self readMessage:nil];
////}
////
////- (void)dealloc {
////    // Unregister the observer when the view controller is deallocated
////   // [[NSNotificationCenter defaultCenter] removeObserver:self];
////    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSPasteboardDidChangeNotification object:nil];
////
////}
////
////@end
//
//
//#import "ViewController.h"
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    self.pasteboard = [NSPasteboard generalPasteboard];
//    self.oldPasteboardString = @"";
//    self.messageString = [NSMutableString stringWithString:@""];
//    [self startPasteboardMonitoring];
//}
//
//- (NSString *)readFromPasteboard {
//    if ([[self.pasteboard types] containsObject:NSPasteboardTypeString]) {
//        NSString *copiedText = [self.pasteboard stringForType:NSPasteboardTypeString];
//        return copiedText;
//    }
//
//    return @"";
//}
//
//- (IBAction)readMessage:(id)sender {
//    NSString *currentPasteboardString = [self readFromPasteboard];
//
//    if (![currentPasteboardString isEqualToString:self.oldPasteboardString]) {
//        self.oldPasteboardString = currentPasteboardString;
//        if (self.messageString.length > 0) {
//                   [self.messageString appendString:@"\n"];
//               }
//       // self.textView.string = currentPasteboardString;
//        [self.messageString appendString:currentPasteboardString];
//               self.textView.string = self.messageString;
//    }
//}
//
//- (void)startPasteboardMonitoring {
//    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(readMessage:) userInfo:nil repeats:YES];
//}
//@end

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startDistributedNotifications];
}

- (void)handleReceivedMessage:(NSNotification *)notification {
    NSString *message = notification.userInfo[@"message"];
    
    NSString *currentText = self.textView.string;
    NSString *newText = [NSString stringWithFormat:@"%@\n%@", currentText, message];
    
    [self.textView setString:newText];
    [self.textView scrollToEndOfDocument:nil];
}

- (void)startDistributedNotifications {
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(handleReceivedMessage:)
                                                            name:@"ChatMessageNotification"
                                                          object:nil];
}

@end
