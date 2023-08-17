//
//  main.m
//  NSXPCConnection Use
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
#import "ServerDelegate.h" // Create a new class for the server delegate

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSXPCListener *listener = [NSXPCListener serviceListener];
        ServerDelegate *delegate = [[ServerDelegate alloc] init];
        listener.delegate = delegate;
//        [listener resume];
        @try {
            [listener resume];
        } @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
        } @finally {
            [[NSRunLoop currentRunLoop] run];
        }
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}

