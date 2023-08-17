//
//  ViewController.m
//  Chat App UDP Student
//
//  Created by admin on 6/8/23.
//

#import "ViewController.h"
#import "ChatController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewDidAppear{
    [super viewDidAppear];
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] stringForKey:@"student"];
    if (savedUsername) {
        // Perform auto-login
        NSLog(@"Student name = %@",savedUsername);
        [self callingChatController:savedUsername];
    }
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)login:(id)sender {
    NSString *user = self.username.stringValue;
    if(user.length>0){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSLog(@"Student name = %@",user);
        [userDefault setValue:user forKey:@"student"];
        [self.view.window close];
        [self callingChatController:user];
    }
}

-(void) callingChatController:(NSString *) username{
    ChatController *chatController = [[ChatController alloc] initWithUserName:username];
    [self.view.window close];
    [self presentViewControllerAsModalWindow:chatController];
}
@end
