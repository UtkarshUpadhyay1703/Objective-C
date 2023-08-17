//
//  main.m
//  BSD Chat App Server
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
        // Receiver
        
        int sockfd, newsockfd;
        struct sockaddr_in serverAddr, clientAddr;
        socklen_t addr_size;
        char buffer[1024];
        
        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        
        memset(&serverAddr, '\0', sizeof(serverAddr));
        serverAddr.sin_family = AF_INET;
        serverAddr.sin_port = htons(SERVER_PORT);
        serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
        
        bind(sockfd, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
        
        listen(sockfd, 10);
        
        addr_size = sizeof(clientAddr);
        newsockfd = accept(sockfd, (struct sockaddr *)&clientAddr, &addr_size);
        
        ssize_t n = read(newsockfd, buffer, sizeof(buffer));
        NSData *data = [NSData dataWithBytes:buffer length:n];
        NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"Received message: %@", message);
        
        close(newsockfd);
        close(sockfd);
    }
    return 0;
}
