//
//  ChatController.h
//  Internet Based Sender
//
//  Created by admin on 6/12/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatController : NSViewController
@property (weak) IBOutlet NSTextField *readMessage;
- (IBAction)sendMessage:(id)sender;
@end

NS_ASSUME_NONNULL_END
