//
//  XPCServerService.m
//  XPCServerService
//
//  Created by admin on 6/7/23.
//

#import "XPCServerService.h"

@implementation XPCServerService

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
