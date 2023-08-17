//
//  LoginViewController.h
//  ChatAPI
//
//  Created by admin on 31/05/23.
//
#import <Cocoa/Cocoa.h>
#import "ChatViewController.h"

@interface LoginViewController : NSViewController

@property (weak) IBOutlet NSTextField *userName;

- (IBAction)loginButton:(id)sender;


@end


