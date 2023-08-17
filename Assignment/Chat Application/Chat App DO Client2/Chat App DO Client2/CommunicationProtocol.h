//
//  CommunicationProtocol.h
//  Chat App DO Client2
//
//  Created by admin on 6/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CommunicationProtocol <NSObject>
- (NSString *)sendMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
