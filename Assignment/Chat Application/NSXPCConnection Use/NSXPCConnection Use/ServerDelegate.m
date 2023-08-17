//
//  ServerDelegate.m
//  NSXPCConnection Use
//
//  Created by admin on 6/2/23.
//

#import "ServerDelegate.h"
#import "ServerProtocol.h"
@implementation ServerDelegate
- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ServerProtocol)]; // Define a protocol for communication
    newConnection.exportedObject = self; // Set the server delegate as the exported object
    [newConnection resume];
    
    return YES;
}

- (void)processRequest:(NSString *)requestText withReply:(void (^)(NSString *))reply {
    // Process the request from the client and send back a reply
    NSString *replyText = [NSString stringWithFormat:@"Processed request: %@", requestText];
    reply(replyText);
}
@end
