//
//  ChatController.m
//  Internet Based Sender
//
//  Created by admin on 6/12/23.
//

#import "ChatController.h"
#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

@interface ChatController ()

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)sendMessage:(id)sender {
#define SERVER_IP "192.168.10.146"
#define PORT_NUMBER 88888
    
    int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (clientSocket < 0) {
        NSLog(@"Failed to create socket");
//        return 1;
    }
    
    // Connect to the server
    struct sockaddr_in serverAddress;
    memset(&serverAddress, 0, sizeof(serverAddress));
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = inet_addr(SERVER_IP);
    serverAddress.sin_port = htons(PORT_NUMBER);
    
    if (connect(clientSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
        NSLog(@"Failed to connect to server");
//        return 1;
    }
    
    NSLog(@"Connected to server");
    
    // Send messages to the server
    while (true) {
//        char message[1024];
//        NSLog(@"Enter a message:");
//        fgets(message, sizeof(message), _readMessage);
//
//        if (strlen(message) <= 1) {
//            NSLog(@"Invalid message");
//            continue;
//        }
//
//        ssize_t bytesSent = send(clientSocket, message, strlen(message), 0);
  
        NSString *message = _readMessage.stringValue;
        message = [message stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];

        if (message.length <= 0) {
            NSLog(@"Invalid message");
            continue;
        }

        const char *messageCString = [message UTF8String];
        ssize_t bytesSent = send(clientSocket, messageCString, strlen(messageCString), 0);

        
        if (bytesSent < 0) {
            NSLog(@"Failed to send message");
            break;
        }
    }
    
    // Close the socket
    close(clientSocket);
}
@end
