//
//  ChatManager.m
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

//#import "ChatManager.h"
//
//@implementation ChatManager
//
//- (void)sendMessage:(NSString *)message {
//    // Code to send the message to the Student app using Distributed Object communication
//    if ([self.delegate respondsToSelector:@selector(didReceiveMessage:fromUser:)]) {
//        [self.delegate didReceiveMessage:message fromUser:@"Teacher"];
//    }
//    [self.remoteChatManager receiveMessage:message];
//}
//#pragma mark - ChatManagerProtocol
//
//// Code to receive messages from the Student app using Distributed Object communication
//- (void)receiveMessage:(NSString *)message {
//    // Code to handle received message
//    if ([self.delegate respondsToSelector:@selector(didReceiveMessage:fromUser:)]) {
//        [self.delegate didReceiveMessage:message fromUser:@"Student"];
//    }
//}
//
//
//@end

#import "ChatManager.h"
#import "ChatManagerProtocol.h"

@interface ChatManager () <ChatManagerProtocol>

@property (nonatomic, strong) id<ChatManagerProtocol> remoteChatManager;

@end

@implementation ChatManager

- (void)sendMessage:(NSString *)message {
    // Code to send the message to the Student app using Distributed Object communication
    if ([self.remoteChatManager respondsToSelector:@selector(receiveMessage:)]) {
        [self.remoteChatManager receiveMessage:message];
    }
}

- (void)receiveMessage:(NSString *)message {
    // Code to handle the received message
    // This method will be called by the Student app through Distributed Object communication
    if ([self.delegate respondsToSelector:@selector(didReceiveMessage:fromUser:)]) {
        [self.delegate didReceiveMessage:message fromUser:@"Student"];
    }
}

@end


