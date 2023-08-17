//
//  Server.h
//  AssignmentWithNotification
//
//  Created by admin on 5/31/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Server : NSViewController

- (void)startServer;

@property (nonatomic, assign) int serverSocket;
@property (nonatomic, strong) NSMutableArray *clientSockets;

//property for message
@property (weak) IBOutlet NSTextField *sendMessage;

//Action for send
- (IBAction)send:(id)sender;


@end

NS_ASSUME_NONNULL_END
