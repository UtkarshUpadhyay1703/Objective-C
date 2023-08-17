//
//  LoginViewServerController.m
//  Chat App DO Server
//
//  Created by admin on 6/2/23.
//

#import "LoginViewServerController.h"
#import "ChatViewController.h"
@interface LoginViewServerController ()

@end

@implementation LoginViewServerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)loginButtonClicked:(id)sender {
    NSString *user = [self.username stringValue];
    NSLog(@"user name = %@",user);
    if(user.length>0){
        ChatViewController *chatViewController = [[ChatViewController alloc] initWithUserName:user];
            [self presentViewControllerAsModalWindow:chatViewController];
    }
}
@end
