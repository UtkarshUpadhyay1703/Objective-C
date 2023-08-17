//
//  ChatManagerDelegate.h
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol ChatManagerDelegate <NSObject>
//
//@end

@protocol ChatManagerDelegate <NSObject>

- (void)didSendMessage:(NSString *)message;
- (void)didReceiveMessage:(NSString *)message fromUser:(NSString *)user;

@end

NS_ASSUME_NONNULL_END
