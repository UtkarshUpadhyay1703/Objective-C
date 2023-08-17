//
//  LoginViewController.h
//  Chat App Teacher
//
//  Created by admin on 6/1/23.
//

#import <Cocoa/Cocoa.h>
#import "TeacherChatViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : NSViewController
@property (weak) IBOutlet NSTextField *usernameTextField;
- (IBAction)loginButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
