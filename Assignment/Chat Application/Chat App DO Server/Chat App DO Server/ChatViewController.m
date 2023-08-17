//
//  ChatViewController.m
//  Chat App DO Server
//
//  Created by admin on 6/2/23.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

-(instancetype) initWithUserName: (NSString *) username{
    self = [super init];
    if(self){
        self.username = username;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSConnection *connection = [NSConnection defaultConnection];
    //    MyServer *server = [[MyServer alloc] init];
    [connection setRootObject:self];
    if (![connection registerName:@"MyServer"]) {
        NSLog(@"Failed to register server");
    }
    NSLog(@"Server started");
}
- (NSString *)sendMessage:(NSString *)message {
    NSLog(@"Received message: %@", message);

//    [[NSRunLoop currentRunLoop] run];
    //changing the message
    NSString *displayMessage = self.writeMessage.stringValue;
    if(displayMessage.length>0){
        NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,displayMessage];
        return chatMessage;
    }
    return @"Message received! very hard work involved";
}
- (IBAction)sendButtonClicked:(id)sender {
    NSString *displayMessage = self.writeMessage.stringValue;
    if(displayMessage.length>0){
        NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,displayMessage];
        NSTextView *textView = self.displayMessage.documentView;
        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
        self.writeMessage.stringValue = @"";
        [self sendMessage:chatMessage];
    }
    
}
@end
