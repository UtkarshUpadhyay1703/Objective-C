//
//  ServerProtocol.h
//  NSXPCConnection client
//
//  Created by admin on 6/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ServerProtocol <NSObject>
- (void)processRequest:(NSString *)requestText withReply:(void (^)(NSString *))reply;
@end

NS_ASSUME_NONNULL_END
