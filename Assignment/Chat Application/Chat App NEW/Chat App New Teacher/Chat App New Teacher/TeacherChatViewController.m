//
//  TeacherChatViewController.m
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import "TeacherChatViewController.h"

@implementation TeacherChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.chatManager.delegate = self;
    
//    NSConnection *connection = [NSConnection defaultConnection];
//    ChatManager *chatManager = [[ChatManager alloc] init];
//    [connection setRootObject:chatManager];
//    BOOL success = [connection registerName:@"TeacherChatApp"];
//    if (!success) {
//        NSLog(@"Failed to register connection");
    
    NSConnection *connection = [NSConnection connectionWithRegisteredName:@"StudentChatApp" host:nil];
    ChatManager *chatManager = (ChatManager *)[connection rootProxy];
    self.chatManager = chatManager;
    self.chatManager.delegate = self;
    }

- (IBAction)sendMessageButtonClicked:(id)sender {
    NSString *message = self.messageTextField.stringValue;
    [self.chatManager sendMessage:message];
}

- (void)didReceiveMessage:(NSString *)message fromUser:(NSString *)user {
    // Code to display received message in the UI
    NSString *receivedMessage = [NSString stringWithFormat:@"%@: %@", user, message];
    
    // Update the UI to display the received message
    dispatch_async(dispatch_get_main_queue(), ^{
        // Assuming you have an outputTextView to display the messages
        NSString *existingText = self.outputTextView.string;
        NSString *newText = [existingText stringByAppendingFormat:@"\n%@", receivedMessage];
        self.outputTextView.string = newText;
    });
}

@end
