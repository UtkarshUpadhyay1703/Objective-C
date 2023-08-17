//
//  MyProtocol.h
//  ipc(do)
//
//  Created by admin on 6/2/23.
//

#import <Foundation/Foundation.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//@protocol MyProtocol <NSObject>
//- (void)sendMessage:(NSString *)message;
//- (NSString *)receiveMessage;
//@end
//
//NS_ASSUME_NONNULL_END

// MyProtocol.h
@protocol MyProtocol
- (NSString *)sendMessage:(NSString *)message;
@end

