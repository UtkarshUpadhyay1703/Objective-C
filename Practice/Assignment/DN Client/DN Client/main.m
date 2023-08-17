//
//  main.m
//  DN Client
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
        
        [center addObserverForName:notificationName
                            object:nil
                             queue:nil
                        usingBlock:^(NSNotification *note) {
                            NSString *message = note.userInfo[@"message"];
                            NSLog(@"Received message from server: %@", message);
                        }];
        
        NSLog(@"Listening for server messages...");
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}

