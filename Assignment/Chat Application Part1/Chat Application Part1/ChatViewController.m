//
//  ChatViewController.m
//  Chat Application Part1
//
//  Created by admin on 5/31/23.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

-(instancetype) initWithUserName: (NSString *)name{
    self = [super init];
    if(self){
        self.username = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.view.window.title = self.username;
}

- (IBAction)sendMessage:(id)sender {
    NSString *message = self.readMessage.stringValue;
    if(message.length>0){
        NSString *chatMessage = [NSString stringWithFormat:@"%@: %@",self.username,message];
        NSTextView *textView = self.displayMessage.documentView;
        [textView.textStorage appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", chatMessage]]];
        self.readMessage.stringValue = @"";
    }
}
- (IBAction)logOut:(id)sender {
    [NSApp terminate:nil];
}
@end
