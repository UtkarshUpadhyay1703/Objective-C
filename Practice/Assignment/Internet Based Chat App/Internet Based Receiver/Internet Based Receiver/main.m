//
//  main.m
//  Internet Based Receiver
//
//  Created by admin on 6/12/23.
//

//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//    return 0;
//}

#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>


//#define SERVER_IP "127.0.0.1"
#define SERVER_IP "192.168.10.146"
#define PORT_NUMBER 88888

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a socket for the client
        int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
        if (clientSocket < 0) {
            NSLog(@"Failed to create socket");
            return 1;
        }
        
        // Connect to the server
        struct sockaddr_in serverAddress;
        memset(&serverAddress, 0, sizeof(serverAddress));
        serverAddress.sin_family = AF_INET;
        serverAddress.sin_addr.s_addr = inet_addr(SERVER_IP);
        serverAddress.sin_port = htons(PORT_NUMBER);
        
        if (connect(clientSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
            NSLog(@"Failed to connect to server");
            return 1;
        }
        
        NSLog(@"Connected to server");
        
        // Send messages to the server
        while (true) {
            char message[1024];
            NSLog(@"Enter a message:");
            fgets(message, sizeof(message), stdin);
            
            if (strlen(message) <= 1) {
                NSLog(@"Invalid message");
                continue;
            }
            
            ssize_t bytesSent = send(clientSocket, message, strlen(message), 0);
            
            if (bytesSent < 0) {
                NSLog(@"Failed to send message");
                break;
            }
        }
        
        // Close the socket
        close(clientSocket);
    }
    
    return 0;
}
