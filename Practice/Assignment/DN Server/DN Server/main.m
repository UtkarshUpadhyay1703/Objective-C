//
//  main.m
//  DN Server
//
//  Created by admin on 6/5/23.
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDistributedNotificationCenter *center = [NSDistributedNotificationCenter defaultCenter];
        NSString *notificationName = @"ServerToClientNotification";
        NSString *message = @"Hello from the server!";
        
        [center postNotificationName:notificationName
                              object:nil
                            userInfo:@{@"message": message}
                  deliverImmediately:YES];
        
        NSLog(@"Message sent to client.");
    }
    return 0;
}

