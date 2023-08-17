//
//  main.m
//  do client
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
#import "MyClient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyClient *client = [[MyClient alloc] init];
        [client sendMessageToServer];
    }
    return 0;
}

