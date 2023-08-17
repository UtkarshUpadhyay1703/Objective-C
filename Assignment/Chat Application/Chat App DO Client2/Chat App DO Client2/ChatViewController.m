//
//  ChatViewController.m
//  Chat App DO Client2
//
//  Created by admin on 6/5/23.
//

#import "ChatViewController.h"
#import "CommunicationProtocol.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self sendMessageToServer];
}

-(instancetype) initWithUserName: (NSString *) username{
self = [super init];
if(self){
    self.username = username;
}
return self;
}

- (void)sendMessageToServer {
//    NSConnection *connection = [NSConnection connectionWithRegisteredName:@"MyServerJD" host:nil];
//    id<CommunicationProtocol> remoteObject = [connection rootProxy];
//    if (remoteObject) {
//        NSString *response = [remoteObject sendMessage:@"Hello, Server!"];
//        NSLog(@"Server response: %@", response);
//        NSString *message = response;
//        if(message.length>0){
//            NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,message];
//            NSTextView *textView = self.displayMessage.documentView;
//            [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
//        }
//    } else {
//        NSLog(@"Failed to connect to server");
//    }
    
    NSConnection *connection = [NSConnection connectionWithRegisteredName:@"MyServer" host:nil];
    NSLog(@"connection = %@",connection);
    id<CommunicationProtocol> remoteObject = (id<CommunicationProtocol>)[connection rootProxy];
    if (remoteObject) {
        NSString *response = [remoteObject sendMessage:@"Hello, Server!"];
        NSLog(@"Server response: %@", response);
        // Rest of your code...
                NSString *message = response;
                if(message.length>0){
                    NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,message];
                    NSTextView *textView = self.displayMessage.documentView;
                    [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
                }
    } else {
        NSLog(@"Failed to connect to server");
    }
    
}


@end
