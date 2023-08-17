//  Server.m
//  AssignmentWithNotification
//
//  Created by admin on 5/31/23.
//

#import "Server.h"
#import <sys/socket.h>
#import <netinet/in.h>

@interface Server ()

@end

@implementation Server

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self startServer];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _clientSockets = [NSMutableArray array];
    }
    return self;
}

- (void)startServer {
    // Create the server socket
    self.serverSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (self.serverSocket < 0) {
        NSLog(@"Error creating server socket");
        return;
    }
    
    // Set up the server address
    struct sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = INADDR_ANY;
    serverAddress.sin_port = htons(12345); // Choose your desired port number
    NSLog(@"Server started");
    
    // Bind the server socket to the server address
    if (bind(self.serverSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
        NSLog(@"Error binding server socket");
        return;
    }
    
    // Start listening for incoming connections
    if (listen(self.serverSocket, 10) < 0) {
        NSLog(@"Error listening for incoming connections");
        return;
    }
    
    NSLog(@"Server started");
    
    while (1) {
        // Accept an incoming client connection
        struct sockaddr_in clientAddress;
        socklen_t clientAddressLength = sizeof(clientAddress);
        int clientSocket = accept(self.serverSocket, (struct sockaddr *)&clientAddress, &clientAddressLength);
        if (clientSocket < 0) {
            NSLog(@"Error accepting client connection");
            continue;
        }
        
        [self.clientSockets addObject:@(clientSocket)];
        
        // Start a new thread to handle client communication
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self handleClientConnection:clientSocket];
        });
    }
}

- (void)handleClientConnection:(int)clientSocket {
    char buffer[1024];
    
    while (1) {
        memset(buffer, 0, sizeof(buffer));
        
        // Receive message from the client
        ssize_t bytesRead = recv(clientSocket, buffer, sizeof(buffer), 0);
        if (bytesRead < 0) {
            NSLog(@"Error receiving message from client");
            break;
        }
        
        if (bytesRead == 0) {
            // Client disconnected
            NSLog(@"Client disconnected");
            break;
        }
        
        NSString *message = [NSString stringWithUTF8String:buffer];
        
        // Broadcast the message to all connected clients
        for (NSNumber *socketNumber in self.clientSockets) {
            int socket = [socketNumber intValue];
            ssize_t bytesSent = send(socket, buffer, strlen(buffer), 0);
            if (bytesSent < 0) {
                NSLog(@"Error broadcasting message to client");
            }
        }
    }
    
    // Remove the client socket from the array
    [self.clientSockets removeObject:@(clientSocket)];
    
    // Close the client socket
    close(clientSocket);
}

- (IBAction)send:(id)sender {
    NSString *message = self.sendMessage.stringValue;
    if (message.length > 0) {
        const char *buffer = [message UTF8String];
        for (NSNumber *socketNumber in self.clientSockets) {
            int socket = [socketNumber intValue];
            ssize_t bytesSent = send(socket, buffer, strlen(buffer), 0);
            if (bytesSent < 0) {
                NSLog(@"Error sending message to client");
            }
        }
        // Message sent successfully
        self.sendMessage.stringValue = @"";
    }
}

@end

