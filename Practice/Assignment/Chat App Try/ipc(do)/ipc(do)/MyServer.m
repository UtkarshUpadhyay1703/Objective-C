//
//  MyServer.m
//  ipc(do)
//
//  Created by admin on 6/2/23.
//

#import "MyServer.h"

@implementation MyServer
- (NSString *)sendMessage:(NSString *)message {
    NSLog(@"Received message: %@", message);
    return @"Message received! very hard work involved";
}
@end
