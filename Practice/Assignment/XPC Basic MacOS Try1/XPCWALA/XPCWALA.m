//
//  XPCWALA.m
//  XPCWALA
//
//  Created by admin on 6/13/23.
//

#import "XPCWALA.h"

@implementation XPCWALA

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}
- (void) addName:(NSString *)aString{
    NSLog(@"%@ Utkarsh",aString);
}

@end
