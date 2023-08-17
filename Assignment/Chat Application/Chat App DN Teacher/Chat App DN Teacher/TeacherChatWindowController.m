//
//  TeacherChatWindowController.m
//  Chat App DN Teacher
//
//  Created by admin on 6/5/23.
//

#import "TeacherChatWindowController.h"

@interface TeacherChatWindowController ()

@end

@implementation TeacherChatWindowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveMessage:)
                                                 name:@"StudentToTeacherNotification"
                                               object:nil];
}



- (void)receiveMessage:(NSNotification *)notification {
    NSString *message = notification.userInfo[@"message"];
    NSString *sender = notification.userInfo[@"sender"];
    NSString *receivedMessage = [NSString stringWithFormat:@"[%@]: %@\n", sender, message];
//    [self.chatTextView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:receivedMessage]];
    
    NSLog(@"received message = %@",receivedMessage);
    
    
//    if(displayMessage.length>0){
//        NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,displayMessage];
//        NSTextView *textView = message.documentView;
//        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
//        self.writeMessage.stringValue = @"";
//        [self sendMessage:chatMessage];
//    }

}

- (IBAction)sendMessage:(id)sender {
    NSString *message = self.messageTextField.stringValue;
    NSDictionary *userInfo = @{@"message": message, @"sender": @"Teacher"};
    [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"TeacherToStudentNotification"
                                                                   object:nil
                                                                 userInfo:userInfo
                                                       deliverImmediately:YES];
    NSString *sentMessage = [NSString stringWithFormat:@"[Teacher]: %@\n", message];
//    [self.chatTextView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:sentMessage]];
    NSLog(@"Sent Message = %@",sentMessage);
    self.messageTextField.stringValue = @"";
}
@end
