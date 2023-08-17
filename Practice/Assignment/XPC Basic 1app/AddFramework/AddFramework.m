//
//  AddFramework.m
//  AddFramework
//
//  Created by admin on 6/13/23.
//

#import "AddFramework.h"

@implementation AddFramework

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}
//- (void) addName:(NSString *) aString withReply:(void (^)(NSString *))reply{
//    NSString *response = [aString stringByAppendingString:@"Utkarsh"];
//    reply(response);
//}

//-(void) addName:(NSString *)message{
//    NSLog(@"%@ + From Utkarsh",message);
//}

- (void)addName:(NSString *)aString username:(NSString *)name {
    NSLog(@"%@ + From Utkarsh",aString);
//    NSLog(@"XPC Method Called");
}
@end
