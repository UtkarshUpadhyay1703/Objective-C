//
//  ChatManagerProtocol.h
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ChatManagerProtocol <NSObject>

- (void)sendMessage:(NSString *)message;
- (void)receiveMessage:(NSString *)message;

@end


NS_ASSUME_NONNULL_END
