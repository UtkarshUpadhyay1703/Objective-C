//
//  TeacherChatWindowController.h
//  Chat App DN Teacher
//
//  Created by admin on 6/5/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TeacherChatWindowController : NSViewController

@property (weak) IBOutlet NSTextField *messageTextField;
@property (weak) IBOutlet NSScrollView *chatTextView;
- (IBAction)sendMessage:(id)sender;

@end

NS_ASSUME_NONNULL_END
