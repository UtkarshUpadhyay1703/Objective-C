//
//  ViewController.m
//  Chat App UDP Teacher
//
//  Created by admin on 6/8/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear{
    [super viewDidAppear];
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] stringForKey:@"teacher"];
    if (savedUsername) {
        // Perform auto-login
        NSLog(@"Teacher name = %@",savedUsername);
        [self callingChatController:savedUsername];
    }
    
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)loginButtonClicked:(id)sender {
    NSString *user = self.username.stringValue;
    if(user.length>0){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSLog(@"Teacher name = %@",user);
        [userDefault setValue:user forKey:@"teacher"];
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
