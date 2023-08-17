//#import <Foundation/Foundation.h>
//
//@protocol ChatManagerDelegate <NSObject>
//
//- (void)didReceiveMessage:(NSString *)message fromUser:(NSString *)user;
//
//@end
//
//@interface ChatManager : NSObject
//
//@property (nonatomic, weak) id<ChatManagerDelegate> delegate;
//
//- (void)sendMessage:(NSString *)message;
//
//@end

#import <Foundation/Foundation.h>
#import "ChatManagerProtocol.h"
#import "ChatManagerDelegate.h"

@interface ChatManager : NSObject <ChatManagerProtocol>

@property (nonatomic, weak) id<ChatManagerDelegate> delegate;

- (void)sendMessage:(NSString *)message;

@end
