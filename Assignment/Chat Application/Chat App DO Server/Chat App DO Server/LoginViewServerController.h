//
//  LoginViewServerController.h
//  Chat App DO Server
//
//  Created by admin on 6/2/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewServerController : NSViewController
@property (weak) IBOutlet NSTextField *username;
- (IBAction)loginButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
