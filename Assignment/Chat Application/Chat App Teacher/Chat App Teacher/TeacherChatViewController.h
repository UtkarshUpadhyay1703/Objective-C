//
//  TeacherChatViewController.h
//  Chat App Teacher
//
//  Created by admin on 6/1/23.
//

#import <Cocoa/Cocoa.h>
#import "ChatProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface TeacherChatViewController : NSViewController<ChatProtocol>
@property (strong) NSString *username;

@property (nonatomic, strong) NSXPCConnection *connection;
@property (weak) IBOutlet NSTextField *messageTextField;
- (IBAction)sendMessage:(id)sender;
- (IBAction)logOut:(id)sender;


@end

NS_ASSUME_NONNULL_END
