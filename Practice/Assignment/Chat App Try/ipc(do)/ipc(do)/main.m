//
//  main.m
//  ipc(do)
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
#import "MyServer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSConnection *connection = [NSConnection defaultConnection];
        MyServer *server = [[MyServer alloc] init];
        [connection setRootObject:server];
        if (![connection registerName:@"MyServerDO"]) {
            NSLog(@"Failed to register server");
            return 1;
        }
        NSLog(@"Server started");
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
// main.m
//#import <Foundation/Foundation.h>
//#import "MyServer.h"
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        MyServer *server = [[MyServer alloc] init];
//        NSConnection *connection = [NSConnection serviceConnectionWithName:@"MyServer" rootObject:server];
//        [connection runInNewThread];
//        [[NSRunLoop currentRunLoop] run];
//    }
//    return 0;
//}


