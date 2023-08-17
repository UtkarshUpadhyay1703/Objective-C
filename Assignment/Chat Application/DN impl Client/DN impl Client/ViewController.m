//
//  ViewController.m
//  DN impl Client
//
//  Created by admin on 6/5/23.
//

#import "ViewController.h"
#import "ChatController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSString *user = [userDefault valueForKey:@"student"];
//    if (user.length == 0) {
//        NSLog(@"No Student");
//    }else{
////        ChatController *chatController = [[ChatController alloc] initWithUserName:user];
//        NSLog(@"Student name = %@",user);
//        [self callingChatController:user];
////        [self presentViewControllerAsModalWindow:chatController];
//    }
}

-(void)viewDidAppear{
    [super viewDidAppear];
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] stringForKey:@"student"];
    if (savedUsername) {
        // Perform auto-login
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
//        ChatController *chatController = [[ChatController alloc] initWithUserName:user];
        NSLog(@"Student name = %@",user);
        [userDefault setValue:user forKey:@"student"];
//        [self.view removeFromSuperview];
        [self.view.window close];
//        [self presentViewControllerAsModalWindow:chatController];
        [self callingChatController:user];
    }
}
-(void) callingChatController:(NSString *) username{
    ChatController *chatController = [[ChatController alloc] initWithUserName:username];
    [self.view.window close];
    [self presentViewControllerAsModalWindow:chatController];
}
@end
