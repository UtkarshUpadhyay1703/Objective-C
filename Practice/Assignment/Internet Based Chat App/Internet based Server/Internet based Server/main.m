//
//  main.m
//  Internet based Server
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

#define PORT_NUMBER 12345

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a socket for the server
        int serverSocket = socket(AF_INET, SOCK_STREAM, 0);
        if (serverSocket < 0) {
            NSLog(@"Failed to create socket");
            return 1;
        }
        
        // Bind the socket to a specific port
        struct sockaddr_in serverAddress;
        memset(&serverAddress, 0, sizeof(serverAddress));
        serverAddress.sin_family = AF_INET;
        serverAddress.sin_addr.s_addr = INADDR_ANY;
        serverAddress.sin_port = htons(PORT_NUMBER);
        
        if (bind(serverSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
            NSLog(@"Failed to bind the socket");
            return 1;
        }
        
        // Listen for incoming connections
        if (listen(serverSocket, 5) < 0) {
            NSLog(@"Failed to listen for connections");
            return 1;
        }
        
        NSLog(@"Server is listening on port %d", PORT_NUMBER);
        
        // Accept incoming connections
        struct sockaddr_in clientAddress;
        socklen_t clientAddressLength = sizeof(clientAddress);
        int clientSocket = accept(serverSocket, (struct sockaddr *)&clientAddress, &clientAddressLength);
        
        if (clientSocket < 0) {
            NSLog(@"Failed to accept connection");
            return 1;
        }
        
        NSLog(@"Client connected");
        
        // Receive and handle messages from the client
        while (true) {
            char message[1024];
            ssize_t bytesRead = recv(clientSocket, message, sizeof(message), 0);
//            NSLog(@"%s",message);
            
            if (bytesRead < 0) {
                NSLog(@"Failed to receive message");
                break;
            } else if (bytesRead == 0) {
                NSLog(@"Client disconnected");
                break;
            }
            
            NSString *receivedMessage = [[NSString alloc] initWithBytes:message length:bytesRead encoding:NSUTF8StringEncoding];
            NSLog(@"Received message: %@", receivedMessage);
        }
        
        // Close the sockets
        close(clientSocket);
        close(serverSocket);
    }
    
    return 0;
}
