//
//  ViewController.m
//  DN impl Server
//
//  Created by admin on 6/5/23.
//

#import "ViewController.h"
#import "ChatController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSString *documentsDirectory = [paths firstObject];
    //    self.filePath = [documentsDirectory stringByAppendingPathComponent:@"ChatAppTeacher.plist"];
    //    self.teacher = [NSMutableDictionary dictionaryWithContentsOfFile:self.filePath];
    //    if (![self.teacher valueForKey:@"teacher"]) {
    //        self.teacher = [NSMutableDictionary dictionary];
    //        NSLog(@"No Teacher");
    //    }else{
    //        ChatController *chatController = [[ChatController alloc] initWithUserName:[_teacher valueForKey:@"teacher"]];
    //        NSLog(@"Teacher name = %@",[_teacher valueForKey:@"teacher"]);
    //        [self presentViewControllerAsModalWindow:chatController];
    //    }
    
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSString *user = [userDefault valueForKey:@"teacher"];
//    if (user.length == 0) {
//        NSLog(@"No Teacher");
//    }else{
////        ChatController *chatController = [[ChatController alloc] initWithUserName:user];
//        NSLog(@"Teacher name = %@",user);
//        [self callingChatController:user];
//        [self presentViewControllerAsModalWindow:chatController];
//    }
}

-(void)viewDidAppear{
    [super viewDidAppear];
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] stringForKey:@"teacher"];
    if (savedUsername) {
        // Perform auto-login
        [self callingChatController:savedUsername];
    }
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

//- (void)presentChatViewControllerWithUsername:(NSString *)username {
//    // Save the username to NSUserDefaults
////    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
//
//    // Instantiate ChatViewController from storyboard
//    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
//    ChatViewController *chatViewController = [storyboard instantiateControllerWithIdentifier:@"ChatViewController"];
//
//    // Configure ChatViewController with the user
//    User *user = [[User alloc] initWithUsername:username];
//    chatViewController.user = user;
//
//    // Present ChatViewController modally
//    [self presentViewControllerAsModalWindow:chatViewController];
//
//    // Dismiss or close LoginViewController
//    [self.view.window close]; // or [self dismissViewController:self]
//}


- (IBAction)loginButtonClicked:(id)sender {
    NSString *user = self.username.stringValue;
    if(user.length>0){
        //        [_teacher setValue:user forKey:@"teacher"];
        //        if([_teacher writeToFile:self.filePath atomically:YES]){
        //            NSLog(@"Teacher useername written properly");
        //            ChatController *chatController = [[ChatController alloc] initWithUserName:user];
        //            [self.view removeFromSuperview];// for hiding all the details after login
        //            [self presentViewControllerAsModalWindow:chatController];
        //        }
        //        else NSLog(@"Failed to write teacher useername inside file");
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSLog(@"Teacher name = %@",user);
        [userDefault setValue:user forKey:@"teacher"];
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
