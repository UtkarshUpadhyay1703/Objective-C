//
//  ChatController.h
//  Chat App UDP Student
//
//  Created by admin on 6/8/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatController : NSViewController

@property (strong) NSString *username;
-(instancetype) initWithUserName:(NSString *) username ;
//- (IBAction)sendMessage:(id)sender;
@property (weak) IBOutlet NSScrollView *displayMessage;
//@property (weak) IBOutlet NSTextField *readMessage;
- (IBAction)logout:(id)sender;



@property int sockfd;
@property struct sockaddr_in servaddr;
@end

NS_ASSUME_NONNULL_END
