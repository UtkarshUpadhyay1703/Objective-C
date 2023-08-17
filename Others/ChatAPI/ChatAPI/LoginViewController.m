//
//  LoginViewController.m
//  ChatAPI
//
//  Created by admin on 31/05/23.
//

#import "LoginViewController.h"
#import "ChatViewController.h"
 
@implementation LoginViewController


-(void)viewDidAppear{
    [super viewDidAppear];
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    if (savedUsername) {
        // Perform auto-login
        [self presentChatViewControllerWithUsername:savedUsername];
    }
    
}

- (IBAction)loginButton:(id)sender {
    NSString *userNameText = self.userName.stringValue;
        
        if ([userNameText isEqualToString:@""]) {
            // Show an error message if the username is empty
            
            [self alertForEmptyUsername];
            
            return;
        }
        
        // Save the username to NSUserDefaults
        [[NSUserDefaults standardUserDefaults] setObject:userNameText forKey:@"username"];
        
        [self presentChatViewControllerWithUsername:userNameText];
        
        NSLog(@"Button pressed");
    
}

- (void)presentChatViewControllerWithUsername:(NSString *)username {
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    ChatViewController *chatViewController = [storyboard instantiateControllerWithIdentifier:@"ChatViewController"];
    chatViewController.username = username;
    
    [self.view.window close];
    [self presentViewControllerAsModalWindow:chatViewController];
}

-(void)alertForEmptyUsername{

    NSAlert * alert = [[NSAlert alloc] init];
    
    [alert addButtonWithTitle:@"ok"];
    [alert setMessageText:@"Empty Username Field"];
    [alert setInformativeText:@"Please Enter the userName"];
    [alert setAlertStyle:NSAlertStyleWarning];
    NSWindow *window = [[NSApplication sharedApplication] mainWindow];
    [alert beginSheetModalForWindow:window completionHandler:^(NSModalResponse returnCode){
        if(returnCode == NSAlertFirstButtonReturn){
//            NSLog(@"Enter the username");
            [self.userName becomeFirstResponder];
        }
    }];
    
}

@end
