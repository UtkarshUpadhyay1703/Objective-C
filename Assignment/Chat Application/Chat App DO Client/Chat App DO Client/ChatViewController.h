//
//  ChatViewController.h
//  Chat App DO Client
//
//  Created by admin on 6/2/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : NSViewController
-(instancetype) initWithUserName: (NSString *) username;
@property (strong) NSString *username;
@property (weak) IBOutlet NSScrollView *displayMessage;
- (void)sendMessageToServer;

@end

NS_ASSUME_NONNULL_END