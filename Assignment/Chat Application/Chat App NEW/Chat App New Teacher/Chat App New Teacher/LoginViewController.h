//
//  LoginViewController.h
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import <Cocoa/Cocoa.h>

@interface LoginViewController : NSViewController

@property (weak) IBOutlet NSTextField *usernameTextField;

- (IBAction)loginButtonClicked:(id)sender;

@end
