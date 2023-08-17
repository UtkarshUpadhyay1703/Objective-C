
#import "ChatViewController.h"


@implementation ChatViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.window.title = self.username;
    // Do view setup here.
    [self readDistributedNotifications];
}

-(instancetype) initWithUserName: (NSString *)name{
    self = [super init];
    if(self){
        self.username = name;
    }
    return self;
}

- (IBAction)logOut:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
    
    [NSApp terminate:nil];
}

- (IBAction)sendMessage:(id)sender {
    //method copy the text from the text field and creat the notification & send notification
    
    NSString *message = self.messageToSend.stringValue;
    
    if(message.length>0){
        [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"ChatMessageNotification"
                                                                       object:message
                                                                     userInfo:@{@"userName": self.username}
                                                           deliverImmediately:YES];
        
        [self.messageToSend setStringValue:@""];
    }
}

- (void)handleReceivedMessage:(NSNotification *)notification {
//this method use to display message
    NSString * userName = notification.userInfo[@"userName"];
    NSString *message = [NSString stringWithFormat:@"%@ : %@", userName,notification.object];
    
    NSString *currentText = self.displayMessage.string;
    NSString *newText = [NSString stringWithFormat:@"%@\n%@", currentText, message];
    
    [self.displayMessage setString:newText];
    [self.displayMessage scrollToEndOfDocument:nil];
}

- (void)readDistributedNotifications {
    //this method is the observer used to look for notification and used to call handleReceivedMessage methode
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(handleReceivedMessage:)
                                                            name:@"ChatMessageNotification"
                                                          object:nil];
}
@end
