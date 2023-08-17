//
//  Client.h
//  ChatApp+Server
//
//  Created by admin on 6/1/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Client : NSViewController
@property (nonatomic, assign) int clientSocket;
@property (weak) IBOutlet NSScrollView *displayMessage;

@end

NS_ASSUME_NONNULL_END
