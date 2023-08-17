//
//  main.m
//  XPCClient
//
//  Created by admin on 6/7/23.
//

#import <Foundation/Foundation.h>

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//    return 0;
//}

//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
////        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.XPCServer"];
//        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"XPCServerService"];
//        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//        [connection resume];
//
//        id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//            NSLog(@"Error: %@", error);
//        }];
//
//        NSString *message = @"Hello from XPCClient!";
//        [proxy processMessage:message];
//        NSLog(@"Send ");
//    }
//    return 0;
//}


#import <Foundation/Foundation.h>
#import "XPCServerProtocol.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"xyz"];
        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
        [connection resume];

        id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
        }];

        NSString *message = @"Hello from XPCClient!";
        [proxy processMessage:message];
        NSLog(@"Sent");
    }
    return 0;
}
