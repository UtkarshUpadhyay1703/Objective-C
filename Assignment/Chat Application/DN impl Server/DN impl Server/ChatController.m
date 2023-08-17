//
//  ChatController.m
//  DN impl Server
//
//  Created by admin on 6/5/23.
//

#import "ChatController.h"
#import "ViewController.h"
@interface ChatController ()

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
//    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *viewController = [storyboard instantiateControllerWithIdentifier:@"ViewController"];
//    [self dismissViewController:self]
//    [viewController.view.window close];
    
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(receivedMessageNotification:)
                                                            name:@"StudentChatNotification"
                                                          object:nil];
}

-(instancetype) initWithUserName:(NSString *) username{
    self = [super init];
    if(self){
        self.username = username;
    }
    return self;
}

- (IBAction)logout:(id)sender {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths firstObject];
//    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"ChatAppTeacher.plist"];
//    NSMutableDictionary *teacher = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
//    if (teacher == nil) {
//        teacher = [NSMutableDictionary dictionary];
//        NSLog(@"Error: no teacher is found !!!!!!!!!!");
//    }else{
//        NSLog(@"Teacher name = %@",[teacher valueForKey:@"teacher"]);
//        [teacher removeObjectForKey:@"teacher"];
//        if([teacher writeToFile:filePath atomically:YES]) NSLog(@"Removed teacher properly");
//        else NSLog(@"failed to remove teacher");
//        [NSApp terminate:nil];
//    }
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"teacher"];
    NSLog(@"Teacher removed successfully");
    [NSApp terminate:nil];
}

- (IBAction)sendMessage:(id)sender {
//    NSDistributedNotificationCenter *center = [NSDistributedNotificationCenter defaultCenter];
//    NSString *notificationName = @"ServerToClientNotification";
////    NSString *message = @"Hello from the server!";
//
//
//    NSString *displayMessage = self.enterMessage.stringValue;
//    if(displayMessage.length>0){
//        NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,displayMessage];
//        NSTextView *textView = self.displayMessage.documentView;
//        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
//        self.enterMessage.stringValue = @"";
//
//    [center postNotificationName:notificationName
//                          object:nil
//                        userInfo:@{@"message": chatMessage}
//              deliverImmediately:YES];
    
    
    NSString *message = self.enterMessage.stringValue;
       
//       [self.enterMessage setStringValue:@""];
        if(message.length>0){
            NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,message];
            NSTextView *textView = self.displayMessage.documentView;
            [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
            self.enterMessage.stringValue = @"";
    
            [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"TeacherChatNotification"
                                                                           object:nil
                                                                         userInfo:@{@"message": chatMessage}
                                                               deliverImmediately:YES];
            
    NSLog(@"Message sent to client.");
    }
}
- (void)receivedMessageNotification:(NSNotification *)notification {
    NSString *message = notification.userInfo[@"message"];
        NSLog(@"Received message from server: %@", message);
    NSTextView *textView = self.displayMessage.documentView;
    [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]]];
}
@end
