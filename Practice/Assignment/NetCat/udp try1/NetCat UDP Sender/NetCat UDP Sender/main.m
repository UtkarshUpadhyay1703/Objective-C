//
//  main.m
//  NetCat UDP Sender
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
        NSString *message = @"Hello, Receiver! sending by student";
        NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
        
        int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
        if (sockfd < 0) {
            NSLog(@"Error creating socket.");
            return 1;
        }
        
        struct sockaddr_in servaddr;
        memset(&servaddr, 0, sizeof(servaddr));
        servaddr.sin_family = AF_INET;
//        servaddr.sin_addr.s_addr = inet_addr("127.0.0.1"); // Receiver IP address
        servaddr.sin_addr.s_addr = inet_addr("192.168.10.146"); // Receiver IP address
        
        servaddr.sin_port = htons(12344); // Receiver port
        
        ssize_t sentBytes = sendto(sockfd, data.bytes, data.length, 0, (struct sockaddr *)&servaddr, sizeof(servaddr));
        if (sentBytes < 0) {
            NSLog(@"Error sending message.");
            return 1;
        }else NSLog(@"sended message to server");
        
        close(sockfd);
    }
    return 0;
}
