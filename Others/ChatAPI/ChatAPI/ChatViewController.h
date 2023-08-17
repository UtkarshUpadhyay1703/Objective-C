//
//  ChatViewController.h
//  ChatAPI
//
//  Created by admin on 31/05/23.
//


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : NSViewController

@property (nonatomic, strong) NSString *username;

-(instancetype) initWithUserName: (NSString *)name;

@property (weak) IBOutlet NSTextField *messageToSend;

@property (unsafe_unretained) IBOutlet NSTextView *displayMessage;


-(IBAction)sendMessage:(id)sender;

- (IBAction)logOut:(id)sender;

@end

NS_ASSUME_NONNULL_END
