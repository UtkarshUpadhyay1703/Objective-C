//
//  LoginViewController.m
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import "LoginViewController.h"
#import "TeacherChatViewController.h"

@implementation LoginViewController

- (IBAction)loginButtonClicked:(id)sender {
    NSString *username = self.usernameTextField.stringValue;
    NSLog(@"Teacher Name = %@",username);
//    if ([username isEqualToString:@"teacher"]) {
        TeacherChatViewController *teacherChatViewController = [[TeacherChatViewController alloc] initWithNibName:@"TeacherChatViewController" bundle:nil];
        [self.view.window setContentViewController:teacherChatViewController];
//    } else if ([username isEqualToString:@"student"]) {
//        StudentChatViewController *studentChatViewController = [[StudentChatViewController alloc] initWithNibName:@"StudentChatViewController" bundle:nil];
//        [self.view.window setContentViewController:studentChatViewController];
//    }
}

@end
