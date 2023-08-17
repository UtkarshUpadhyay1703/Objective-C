//
//  ChatViewController.h
//  Chat Application Part1
//
//  Created by admin on 5/31/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : NSViewController
//normal property to store the username
@property (nonatomic, strong) NSString *username;
//creating the initilizer to initilize with the userName
-(instancetype) initWithUserName: (NSString *)name;

//outlet for message reading
@property (weak) IBOutlet NSTextField *readMessage;

//outlet for message display
@property (weak) IBOutlet NSScrollView *displayMessage;



//Action for sinding the message
- (IBAction)sendMessage:(id)sender;
//Action for logout
- (IBAction)logOut:(id)sender;



@end

NS_ASSUME_NONNULL_END
