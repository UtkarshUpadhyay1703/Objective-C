//
//  LoginViewController.m
//  Chat App Teacher
//
//  Created by admin on 6/1/23.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)loginButtonClicked:(id)sender {
    NSString *username = self.usernameTextField.stringValue;
    
    if (username.length > 0) {
        TeacherChatViewController *chatViewController = [[TeacherChatViewController alloc] initWithNibName:@"ChatViewController" bundle:nil];
        chatViewController.username = username;
        
        [self.view.window setContentViewController:chatViewController];
    }
}
@end
