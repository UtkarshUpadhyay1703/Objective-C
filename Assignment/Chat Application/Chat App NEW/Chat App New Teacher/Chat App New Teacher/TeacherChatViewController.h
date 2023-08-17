//
//  TeacherChatViewController.h
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import <Cocoa/Cocoa.h>
#import "ChatManager.h"

@interface TeacherChatViewController : NSViewController <ChatManagerDelegate>

@property (nonatomic, strong) ChatManager *chatManager;

- (IBAction)sendMessageButtonClicked:(id)sender;

@property (weak) IBOutlet NSTextField *messageTextField;
@property (weak) IBOutlet NSScrollView *outputTextView;

@end
