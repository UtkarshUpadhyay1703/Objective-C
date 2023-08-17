//
//  LoginController.h
//  Chat App DO Client
//
//  Created by admin on 6/2/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginController : NSViewController
@property (weak) IBOutlet NSTextField *username;
- (IBAction)loginButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
