//  Client.m
//  ChatApp+Client
//
//  Created by admin on 5/31/23.
//

#import "Client.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h> // Add this import statement

@interface Client ()

@end

@implementation Client

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)connectToServer:(NSString *)serverIP {
    // Create the client socket
    self.clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (self.clientSocket < 0) {
        NSLog(@"Error creating client socket");
        return;
    }
    
    // Set up the server address
    struct sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = inet_addr([serverIP UTF8String]);
    serverAddress.sin_port = htons(12345); // Use the same port number as the server
    
    // Connect to the server
    if (connect(self.clientSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
        NSLog(@"Error connecting to server");
        return;
    }
    
    NSLog(@"Connected to server");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self startSendingMessages];
    });
    
    [self startReceivingMessages];
}

- (void)startSendingMessages {
    char buffer[1024];
    
    while (1) {
        fgets(buffer, sizeof(buffer), stdin);
        
        // Send message to the server
        ssize_t bytesSent = send(self.clientSocket, buffer, strlen(buffer), 0);
        if (bytesSent < 0) {
            NSLog(@"Error sending message to server");
            break;
        }
    }
}

- (void)startReceivingMessages {
    char buffer[1024];
    
    while (1) {
        memset(buffer, 0, sizeof(buffer));
        
        ssize_t bytesRead = recv(self.clientSocket, buffer, sizeof(buffer), 0);
        if (bytesRead < 0) {
            NSLog(@"Error receiving message from server");
            break;
        }
        
        if (bytesRead == 0) {
            NSLog(@"Server disconnected");
            break;
        }
        
        NSString *message = [NSString stringWithUTF8String:buffer];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self appendMessageToChat:message];
        });
    }
    
    // Close the client socket
    close(self.clientSocket);
}

- (void)appendMessageToChat:(NSString *)message {
    NSString *formattedMessage = [NSString stringWithFormat:@"%@\n", message];
    NSAttributedString *attributedMessage = [[NSAttributedString alloc] initWithString:formattedMessage];
    NSTextView *textView = self.displayMessage.documentView;
    [[textView textStorage] appendAttributedString:attributedMessage];
}

@end

