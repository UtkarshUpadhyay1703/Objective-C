//
//  main.m
//  BSD Chat App Sender
//
//  Created by admin on 6/9/23.
//

#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define SERVER_PORT 8888

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Sender
        
        NSString *message = @"Hello from Application 1!";
        NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
        
        int sockfd;
        struct sockaddr_in serverAddr;
        
        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        
        memset(&serverAddr, '\0', sizeof(serverAddr));
        serverAddr.sin_family = AF_INET;
        serverAddr.sin_port = htons(SERVER_PORT);
        serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
        
        connect(sockfd, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
        
        write(sockfd, [data bytes], [data length]);
        
        close(sockfd);
        
        NSLog(@"Message sent!");
    }
    return 0;
}
