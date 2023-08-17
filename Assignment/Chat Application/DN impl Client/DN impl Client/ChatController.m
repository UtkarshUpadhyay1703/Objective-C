//
//  ChatController.m
//  DN impl Client
//
//  Created by admin on 6/5/23.
//

#import "ChatController.h"

@interface ChatController ()

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    //    [self receiveMessage];
    //    [self startDistributedNotifications];
    // Register to receive notifications from the teacher's chat application
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(receivedMessageNotification:)
                                                            name:@"TeacherChatNotification"
                                                          object:nil];
}
- (IBAction)reload:(id)sender {
    //    [self receiveMessage];
}

-(instancetype) initWithUserName:(NSString *) username{
    self = [super init];
    if(self){
        self.username = username;
    }
    return self;
}

//-(void) receiveMessage{
//    NSDistributedNotificationCenter *center = [NSDistributedNotificationCenter defaultCenter];
//    NSString *notificationName = @"ServerToClientNotification";
//
//    [center addObserverForName:notificationName
//                        object:nil
//                         queue:nil
//                    usingBlock:^(NSNotification *note) {
//                        NSString *message = note.userInfo[@"message"];
//                        NSLog(@"Received message from server: %@", message);
//        NSTextView *textView = self.displayMessage.documentView;
//        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]]];
//                    }];
//    [[NSRunLoop currentRunLoop] run];
//    NSLog(@"Listening for server messages...");
//}

//- (void)handleReceivedMessage:(NSNotification *)notification {
//    NSString *message = notification.userInfo[@"message"];
//
////    NSString *currentText = self.textView.string;
////    NSString *newText = [NSString stringWithFormat:@"%@\n%@", currentText, message];
//
//    NSLog(@"Received message from server: %@", message);
//NSTextView *textView = self.displayMessage.documentView;
//[textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]]];
//
////    [self.textView setString:newText];
////    [self.textView scrollToEndOfDocument:nil];
//}

//- (void)startDistributedNotifications {
//    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
//                                                        selector:@selector(handleReceivedMessage:)
//                                                            name:@"ChatMessageNotification"
//                                                          object:nil];
//}

//OR
- (void)receivedMessageNotification:(NSNotification *)notification {
    NSString *message = notification.userInfo[@"message"];
    
    // Add the received message to the chat history
    //    NSString *chatHistory = self.chatTextView.string;
    //    self.chatTextView.string = [chatHistory stringByAppendingFormat:@"Teacher: %@\n", message];
    NSLog(@"Received message from server: %@", message);
    NSTextView *textView = self.displayMessage.documentView;
    [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]]];
}

- (IBAction)logOut:(id)sender {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"student"];
    NSLog(@"Student removed successfully");
    [NSApp terminate:nil];
}

- (IBAction)sendMessage:(id)sender {
    NSString *message = self.enterMessage.stringValue;
    
    if(message.length>0){
        NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,message];
        NSTextView *textView = self.displayMessage.documentView;
        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
        self.enterMessage.stringValue = @"";
        
        [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"StudentChatNotification"
                                                                       object:nil
                                                                     userInfo:@{@"message": chatMessage}
                                                           deliverImmediately:YES];
        
        NSLog(@"Message sent to client.");
    }
    
}
@end
