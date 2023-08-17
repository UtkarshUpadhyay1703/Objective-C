//
//  ChatController.h
//  DN impl Server
//
//  Created by admin on 6/5/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatController : NSViewController

-(instancetype) initWithUserName:(NSString *) username;
@property (strong) NSString *username;
@property (weak) IBOutlet NSTextField *enterMessage;
@property (weak) IBOutlet NSScrollView *displayMessage;
- (IBAction)sendMessage:(id)sender;
- (IBAction)logout:(id)sender;

@end

NS_ASSUME_NONNULL_END
