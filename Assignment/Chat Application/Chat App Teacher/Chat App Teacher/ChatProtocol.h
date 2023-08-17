//
//  ChatProtocol.h
//  Chat App Teacher
//
//  Created by admin on 6/1/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ChatProtocol <NSObject>
- (void)receiveMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
