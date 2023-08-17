//
//  main.m
//  XPC Basic 1app
//
//  Created by admin on 6/13/23.
//

#import <Foundation/Foundation.h>
//#import "AddFramework.h"
#import "AddFrameworkProtocol.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        // Create the XPC Service connection
        //        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.AddFramework"];
//        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.faronics.AddFramework"];
//        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(AddFrameworkProtocol)];
//
        // Establish the connection
//        [connection resume];
        
        // Get a proxy object to communicate with the XPC Service
//        id<AddFrameworkProtocol> service = [connection remoteObjectProxyWithErrorHandler:^(NSError *error) {
//            NSLog(@"App A XPC Service error: %@", error);
//        }];
        //        NSLog(@"%@",service);
        // Call a method on the XPC Service
        //        [service sendMessage:@"Hello from App A"];
        //        [service addName:@"Wow" withReply:<#^(NSString *)reply#>]
//        [service addName:@"WOW"];
        
        // Cleanup and invalidate the connection
//        [connection invalidate];
                
        
        //OR
        
        NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.faronics.AddFramework"];
           connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(AddFrameworkProtocol)];
           connection.interruptionHandler = ^{
                  NSLog(@"interruption");
              };
           connection.invalidationHandler = ^{
                  NSLog(@"invalidation");
              };
              [connection resume];
        id<AddFrameworkProtocol> service = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
                  NSLog(@"%@",error);
              }];
        
//        self.service = [self.connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//                  NSLog(@"%@",error);
//              }];
        
        [service addName:@"Aniket" username:@"hi"];
//           view.window.title = self.user.username;
//           [self startDistributedNotifications];
        
        
    }
    
    return 0;
}
