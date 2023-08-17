//
//  ChatController.h
//  Internet Based Server
//
//  Created by admin on 6/12/23.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
//#include <sys/socket.h>
//#include <netinet/in.h>
//#import "ChatController.h"
//#import "GCDAsyncSocket.h"
#import <CocoaAsyncSocket/GCDAsyncSocket.h>


NS_ASSUME_NONNULL_BEGIN

@interface ChatController : NSViewController<GCDAsyncSocketDelegate>
@property (weak) IBOutlet NSScrollView *displayMessage;
@property (nonatomic, strong) GCDAsyncSocket *serverSocket;
@property (nonatomic, strong) GCDAsyncSocket *clientSocket;
@property (nonatomic, strong) NSTextView *textView;
@end

NS_ASSUME_NONNULL_END
