//
//  ChatController.h
//  DN impl Client
//
//  Created by admin on 6/5/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatController : NSViewController
@property (weak) IBOutlet NSScrollView *displayMessage;
@property (strong) NSString *username;
-(instancetype) initWithUserName:(NSString *) username ;
//- (IBAction)reload:(id)sender;
//- (void)handleReceivedMessage:(NSNotification *)notification;
//- (void)startDistributedNotifications;
@property (weak) IBOutlet NSTextField *enterMessage;
- (IBAction)sendMessage:(id)sender;
- (IBAction)logOut:(id)sender;

@end

NS_ASSUME_NONNULL_END
