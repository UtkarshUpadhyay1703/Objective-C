//
//  TeacherChatViewController.m
//  Chat App Teacher
//
//  Created by admin on 6/1/23.
//

#import "TeacherChatViewController.h"

@interface TeacherChatViewController ()

@end

@implementation TeacherChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Connect to the student chat app
    self.connection = [[NSXPCConnection alloc] init];
    self.connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ChatProtocol)];
    [self.connection resume];

    // Set the exported object as the delegate for receiving messages from the student
    self.connection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ChatProtocol)];
    self.connection.exportedObject = self;
}

- (IBAction)logOut:(id)sender {
    [NSApp terminate:nil];
}

- (IBAction)sendMessage:(id)sender {
    NSString *message = self.messageTextField.stringValue;
    if (message.length > 0) {
        // Call the method on the student's chat app to send the message
        id<ChatProtocol> remoteObjectProxy = [self.connection remoteObjectProxy];
        [remoteObjectProxy receiveMessage:message];
        self.messageTextField.stringValue = @"";
    }
}

// Implement the method defined in the ChatProtocol to receive messages from the student
- (void)receiveMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *currentText = self.messageTextField.stringValue;
        self.messageTextField.stringValue = [NSString stringWithFormat:@"%@\nTeacher: %@", currentText, message];
    });
}
@end
