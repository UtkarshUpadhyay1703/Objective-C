//
//  ChatController.m
//  Internet Based Server
//
//  Created by admin on 6/12/23.
//

//#import "ChatController.h"
//
//
//@interface ChatController ()
//
//@end
//
//@implementation ChatController
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do view setup here.
//#define PORT_NUMBER 12345
//    // Create a socket for the server
//    int serverSocket = socket(AF_INET, SOCK_STREAM, 0);
//    if (serverSocket < 0) {
//        NSLog(@"Failed to create socket");
//    }
//
//    // Bind the socket to a specific port
//    struct sockaddr_in serverAddress;
//    memset(&serverAddress, 0, sizeof(serverAddress));
//    serverAddress.sin_family = AF_INET;
//    serverAddress.sin_addr.s_addr = INADDR_ANY;
//    serverAddress.sin_port = htons(PORT_NUMBER);
//
//    if (bind(serverSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
//        NSLog(@"Failed to bind the socket");
//    }
//
//    // Listen for incoming connections
//    if (listen(serverSocket, 5) < 0) {
//        NSLog(@"Failed to listen for connections");
//    }
//
//    NSLog(@"Server is listening on port %d", PORT_NUMBER);
//
//    // Accept incoming connections
//    struct sockaddr_in clientAddress;
//    socklen_t clientAddressLength = sizeof(clientAddress);
//    int clientSocket = accept(serverSocket, (struct sockaddr *)&clientAddress, &clientAddressLength);
//
//    if (clientSocket < 0) {
//        NSLog(@"Failed to accept connection");
//    }
//
//    NSLog(@"Client connected");
//
//    // Receive and handle messages from the client
//    while (true) {
//        char message[1024];
//        ssize_t bytesRead = recv(clientSocket, message, sizeof(message), 0);
////            NSLog(@"%s",message);
//
//        if (bytesRead < 0) {
//            NSLog(@"Failed to receive message");
//            break;
//        } else if (bytesRead == 0) {
//            NSLog(@"Client disconnected");
//            break;
//        }
//
//        NSString *receivedMessage = [[NSString alloc] initWithBytes:message length:bytesRead encoding:NSUTF8StringEncoding];
//        NSLog(@"Received message: %@", receivedMessage);
//        NSTextView *textView = self.displayMessage.documentView;
//        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", receivedMessage]]];
//    }
//
//    // Close the sockets
//    close(clientSocket);
//    close(serverSocket);
//
//}


//@end


#import "ChatController.h"
//#import "GCDAsyncSocket.h"

#define PORT_NUMBER 88888

@interface ChatController () 



@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView = self.displayMessage.documentView;
    
    // Initialize and start the server socket
    self.serverSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    NSError *error = nil;
    if (![self.serverSocket acceptOnPort:PORT_NUMBER error:&error]) {
        NSLog(@"Failed to start server: %@", error);
    } else {
        NSLog(@"Server is listening on port %d", PORT_NUMBER);
    }
}

#pragma mark - GCDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    self.clientSocket = newSocket;
    NSLog(@"Client connected");
    
    // Start reading data from the client socket
    [self.clientSocket readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSString *receivedMessage = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Received message: %@", receivedMessage);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", receivedMessage]]];
    });
    
    // Continue reading data from the client socket
    [self.clientSocket readDataWithTimeout:-1 tag:0];
}

@end

