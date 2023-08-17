//
//  main.m
//  NetCat UDP Receiver
//
//  Created by admin on 6/7/23.
//
#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
        if (sockfd < 0) {
            NSLog(@"Error creating socket.");
            return 1;
        }
        
        struct sockaddr_in servaddr;
        memset(&servaddr, 0, sizeof(servaddr));
        servaddr.sin_family = AF_INET;
        servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
        servaddr.sin_port = htons(12344); // Port to listen on
        
        if (bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
            NSLog(@"Error binding socket.");
            return 1;
        }
        
        char buffer[1024];
        ssize_t receivedBytes = recvfrom(sockfd, buffer, sizeof(buffer), 0, NULL, NULL);
        if (receivedBytes < 0) {
            NSLog(@"Error receiving message.");
            return 1;
        }
        
        NSData *data = [NSData dataWithBytes:buffer length:receivedBytes];
        NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Received message: %@", message);
        
        close(sockfd);
    }
    return 0;
}
