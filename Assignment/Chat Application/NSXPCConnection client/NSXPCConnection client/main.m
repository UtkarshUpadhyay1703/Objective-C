//
//  main.m
//  NSXPCConnection client
//
//  Created by admin on 6/2/23.
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
#import "ServerProtocol.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.NSXPCConnection Use"]; // Replace with the identifier of the server app
        
        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ServerProtocol)];
        [connection resume];
        
        id<ServerProtocol> serverProxy = [connection remoteObjectProxy];
        
        // Call methods on the server app
        [serverProxy processRequest:@"Hello Server!" withReply:^(NSString *reply) {
            NSLog(@"Received reply: %@", reply);
        }];
        
        [connection invalidate];
    }
    return 0;
}


