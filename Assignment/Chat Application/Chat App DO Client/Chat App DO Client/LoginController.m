//
//  LoginController.m
//  Chat App DO Client
//
//  Created by admin on 6/2/23.
//

#import "LoginController.h"
#import "ChatViewController.h"
@interface LoginController ()

@end

@implementation LoginController

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
