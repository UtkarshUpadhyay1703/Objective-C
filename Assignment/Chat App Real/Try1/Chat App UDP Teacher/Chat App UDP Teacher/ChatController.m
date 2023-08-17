//
//  ChatController.m
//  Chat App UDP Teacher
//
//  Created by admin on 6/8/23.
//

#import "ChatController.h"
#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
@interface ChatController ()

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (self.sockfd < 0) {
        NSLog(@"Error creating socket.");
    }
    memset(&_servaddr, 0, sizeof(_servaddr));
    _servaddr.sin_family = AF_INET;
//    _servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    _servaddr.sin_addr.s_addr = inet_addr("192.168.10.152");
    _servaddr.sin_port = htons(12355); // Port to listen on
    
//    [self performSelector:@selector(receiveMessage) withObject:nil afterDelay:2.0];
}

-(instancetype) initWithUserName:(NSString *) username{
    self = [super init];
    if(self){
        self.username = username;
    }
    return self;
}

- (IBAction)sendMessage:(id)sender {
    NSString *message = self.enterMessage.stringValue;
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    
    ssize_t sentBytes = sendto(self.sockfd, data.bytes, data.length, 0, (struct sockaddr *)&_servaddr, sizeof(self.servaddr));
    if (sentBytes < 0) {
        NSLog(@"Error sending message.");
    }else{
        NSTextView *textView = self.displayMessage.documentView;
        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]]];
    }
    _enterMessage.stringValue = @"";
//    [self receiveMessage];
}

//-(void) receiveMessage {
//
//    
//    if (bind(self.sockfd, (struct sockaddr *)&_servaddr, sizeof(self.servaddr)) < 0) {
//            NSLog(@"Error binding socket.");
//        }
//
//        char buffer[1024];
//        ssize_t receivedBytes = recvfrom(self.sockfd, buffer, sizeof(buffer), 0, NULL, NULL);
//        if (receivedBytes < 0) {
//            NSLog(@"Error receiving message.");
//        }
//
//        NSData *data = [NSData dataWithBytes:buffer length:receivedBytes];
//        NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"Received message: %@", message);
//        NSTextView *textView = self.displayMessage.documentView;
//        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]]];
//}

- (IBAction)logout:(id)sender {
    close(self.sockfd);
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"teacher"];
    NSLog(@"Teacher removed successfully");
    [NSApp terminate:nil];
}
@end
