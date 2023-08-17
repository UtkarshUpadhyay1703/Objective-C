//
//  MyClient.m
//  do client
//
//  Created by admin on 6/2/23.
//

#import "MyClient.h"
#import "MyProtocol.h"
@implementation MyClient
- (void)sendMessageToServer {
    NSConnection *connection = [NSConnection connectionWithRegisteredName:@"MyServerDO" host:nil];
    id<MyProtocol> remoteObject = [connection rootProxy];
    if (remoteObject) {
        NSString *response = [remoteObject sendMessage:@"Hello, Server!"];
        NSLog(@"Server response: %@", response);
    } else {
        NSLog(@"Failed to connect to server");
    }
}
@end
