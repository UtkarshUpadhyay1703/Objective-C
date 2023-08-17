//
//  ChatViewController.h
//  Chat App DO Server
//
//  Created by admin on 6/2/23.
//

#import <Cocoa/Cocoa.h>
#import "CommunicationProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : NSViewController<CommunicationProtocol>
@property (strong) NSString *username;
-(instancetype) initWithUserName: (NSString *) username;
@property (weak) IBOutlet NSTextField *writeMessage;
- (IBAction)sendButtonClicked:(id)sender;
@property (weak) IBOutlet NSScrollView *displayMessage;

@end

NS_ASSUME_NONNULL_END
