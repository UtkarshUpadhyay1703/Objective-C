//
//  XPCServerProtocol.h
//  XPCClient
//
//  Created by admin on 6/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XPCServerProtocol <NSObject>
- (void)processMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
