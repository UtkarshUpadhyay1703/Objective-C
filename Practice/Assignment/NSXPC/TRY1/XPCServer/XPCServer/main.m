//
//  main.m
//  XPCServer
//
//  Created by admin on 6/7/23.
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

//#import <Foundation/Foundation.h>
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol>
//@end
//
//@implementation XPCServer
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//        NSXPCListener *listener = [NSXPCListener serviceListener];
//        listener.delegate = server;
//        [listener resume];
//        [[NSRunLoop currentRunLoop] run];
//    }
//    return 0;
//}

//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//        NSXPCListener *listener = [NSXPCListener serviceListener];
//        listener.delegate = server;
//        [listener resume];
//        [[NSRunLoop currentRunLoop] run];
//    }
//    return 0;
//}

//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer {
//    NSXPCListener *_listener;
//}
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//- (void)start {
//    _listener = [NSXPCListener serviceListener];
//    _listener.delegate = self;
//    [_listener resume];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//        [server start];
//    }
//    return 0;
//}

//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer {
//    NSXPCListener *_listener;
//}
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//- (void)start {
//    _listener = [[NSXPCListener alloc] initWithMachServiceName:@"XPCServerService"];
////    NSXPCListener *listener = [[NSXPCListener alloc] initWithMachServiceName:@"XPCServerService"];
//    _listener.delegate = self;
//    [_listener resume];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//        [server start];
//    }
//    return 0;
//}


//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer {
//    NSXPCListener *_listener;
//}
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//- (void)start {
//    _listener = [[NSXPCListener alloc] initWithMachServiceName:@"XPCServerService"];
//    _listener.delegate = self;
//    [_listener resume];
//    [[NSRunLoop currentRunLoop] run];
//
//    // Add the client code here
//    NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.XPCServer"];
//    connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    [connection resume];
//
//    id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//    NSString *message = @"Hello from XPCClient!";
//    [proxy processMessage:message];
//    NSLog(@"Send");
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//        [server start];
//    }
//    return 0;
//}


//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer {
//    NSXPCListener *_listener;
//}
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//- (void)start {
//    _listener = [[NSXPCListener alloc] initWithMachServiceName:@"XPCServerService"];
//    _listener.delegate = self;
//    [_listener resume];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//- (void)performClientTask {
//    NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.XPCServer"];
//    connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    [connection resume];
//
//    id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//    NSString *message = @"Hello from XPCClient!";
//    [proxy processMessage:message];
//    NSLog(@"Sent message to server");
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//        [server start];
////        [server performClientTask];
//    }
//    return 0;
//}




//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer {
//    NSXPCListener *_listener;
//}
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//- (void)start {
//    _listener = [[NSXPCListener alloc] initWithMachServiceName:@"XPCServerService"];
//    _listener.delegate = self;
//    [_listener resume];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//- (void)performClientTask {
//    NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.XPCServerService"];
//    connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    [connection resume];
//
//    id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//    NSString *message = @"Hello from XPCClient!";
//    [proxy processMessage:message];
//    NSLog(@"Sent message to server");
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//
//        // Run the server on a background thread
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            [server start];
//        });
//
//        // Perform client tasks
//        [server performClientTask];
//
//        // Keep the main thread alive for a while to allow client tasks to complete
//        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
//    }
//    return 0;
//}



//#import <Foundation/Foundation.h>
//
//@protocol XPCServerProtocol
//- (void)processMessage:(NSString *)message;
//@end
//
//@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
//@end
//
//@implementation XPCServer {
//    NSXPCListener *_listener;
//}
//
//- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
//    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    newConnection.exportedObject = self;
//    [newConnection resume];
//    return YES;
//}
//
//- (void)processMessage:(NSString *)message {
//    NSLog(@"Received message: %@", message);
//}
//
//- (void)start {
//    _listener = [[NSXPCListener alloc] initWithMachServiceName:@"XPCServerService"];
//    _listener.delegate = self;
//    [_listener resume];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//- (void)performClientTask {
//    NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.XPCServerService"];
//    connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
//    [connection resume];
//
//    id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//    NSString *message = @"Hello from XPCClient!";
//    [proxy processMessage:message];
//    NSLog(@"Sent message to server");
//}
//
//@end
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        XPCServer *server = [[XPCServer alloc] init];
//
//        // Start the server
//        [server start];
//
//        // Perform client tasks
//        [server performClientTask];
//
//        // Keep the main thread alive for a while to allow client tasks to complete
//        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
//    }
//    return 0;
//}


#import <Foundation/Foundation.h>

@protocol XPCServerProtocol
- (void)processMessage:(NSString *)message;
@end

@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
@end

@implementation XPCServer {
    NSXPCListener *_listener;
}

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
    newConnection.exportedObject = self;
    [newConnection resume];
    return YES;
}

- (void)processMessage:(NSString *)message {
    NSLog(@"Received message: %@", message);
}

- (void)start {
    _listener = [[NSXPCListener alloc] initWithMachServiceName:@"com.faronics.XPCServerService"];
    _listener.delegate = self;
    [_listener resume];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        XPCServer *server = [[XPCServer alloc] init];
        [server start];

        // Perform client tasks
        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"xyz"];
        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
        [connection resume];

        id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
        }];

        NSString *message = @"Hello from XPCClient!";
        [proxy processMessage:message];
        NSLog(@"Sent message to server");

        // Enter the run loop
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
