//
//  LoginViewController.h
//  Chat Application Part1
//
//  Created by admin on 5/31/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : NSViewController
//userName
@property (weak) IBOutlet NSTextField *userName;
//Action of login
- (IBAction)login:(id)sender;

@end

NS_ASSUME_NONNULL_END
