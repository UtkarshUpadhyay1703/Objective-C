//
//  main.m
//  CFSocket Server
//
//  Created by admin on 6/5/23.
//

//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//    return 0;
//}

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#include <netinet/in.h>
#include <arpa/inet.h>


#define kBufferSize 1024

// Socket context structure
typedef struct {
    CFSocketRef socket;
    CFMutableArrayRef clients;
} ServerContext;

// Client structure
typedef struct {
    CFSocketNativeHandle handle;
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
} Client;

// Callback function for handling incoming connections
void AcceptConnection(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info);

// Callback function for handling read events
void HandleReadStream(CFReadStreamRef stream, CFStreamEventType eventType, void *info);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a socket context
        ServerContext serverContext;
        serverContext.socket = NULL;
        serverContext.clients = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);


        // Create a TCP socket
        CFSocketContext socketContext = {0, &serverContext, NULL, NULL, NULL};
        CFSocketRef socket = CFSocketCreate(kCFAllocatorDefault, PF_INET, SOCK_STREAM, IPPROTO_TCP, kCFSocketAcceptCallBack, (CFSocketCallBack)&AcceptConnection, &socketContext);

        // Set socket options (e.g., reuse address)
        int reuse = 1;
        setsockopt(CFSocketGetNative(socket), SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));

        // Create a sockaddr_in structure for binding
//        struct sockaddr_in addr;
        struct sockaddr_in addr = {0};
        inet_pton(AF_INET, "192.168.0.100", &(addr.sin_addr));
        memset(&addr, 0, sizeof(addr));
        addr.sin_len = sizeof(addr);
        addr.sin_family = AF_INET;
        addr.sin_port = htons(1234); // Replace with desired port


        // Bind the socket to the address
        CFDataRef address = CFDataCreate(kCFAllocatorDefault, (UInt8 *)&addr, sizeof(addr));
        CFSocketSetAddress(socket, address);

        // Create a run loop source and add it to the current run loop
        CFRunLoopSourceRef runLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, socket, 0);
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, kCFRunLoopCommonModes);

        // Start the run loop
        CFRunLoopRun();

        // Clean up resources
        CFRelease(runLoopSource);
        CFRelease(socket);
        CFRelease(address);
        CFRelease(serverContext.clients);
    }
    return 0;
}

// Callback function for handling incoming connections
void AcceptConnection(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info) {
    ServerContext *serverContext = (ServerContext *)info;

    if (type == kCFSocketAcceptCallBack) {
        // Accept the incoming connection
        CFSocketNativeHandle handle = *(CFSocketNativeHandle *)data;
        CFReadStreamRef readStream;
        CFWriteStreamRef writeStream;
        CFStreamCreatePairWithSocket(kCFAllocatorDefault, handle, &readStream, &writeStream);

        // Set up read and write streams
        CFStreamClientContext clientContext = {0, NULL, NULL, NULL, NULL};
        CFReadStreamSetClient(readStream, kCFStreamEventHasBytesAvailable, HandleReadStream, &clientContext);
        CFReadStreamScheduleWithRunLoop(readStream, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
        CFReadStreamOpen(readStream);

        CFWriteStreamSetProperty(writeStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
        CFWriteStreamOpen(writeStream);

        // Store the client in the server context
        Client client;
        client.handle = handle;
        client.readStream = readStream;
        client.writeStream = writeStream;
//        CFArrayAppendValue(serverContext->clients, &client);
        ServerContext serverContext;
        memset(&serverContext, 0, sizeof(serverContext));
        serverContext.socket = NULL;
        serverContext.clients = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    }
}

// Callback function for handling read events
void HandleReadStream(CFReadStreamRef stream, CFStreamEventType eventType, void *info) {
    if (eventType == kCFStreamEventHasBytesAvailable) {
        UInt8 buffer[kBufferSize];
        CFIndex bytesRead = CFReadStreamRead(stream, buffer, kBufferSize);

        if (bytesRead > 0) {
            // Handle the received message
            NSString *message = [[NSString alloc] initWithBytes:buffer length:bytesRead encoding:NSUTF8StringEncoding];
            printf("Received: %s", [message UTF8String]);

            // Broadcast the message to all clients
            ServerContext *serverContext = (ServerContext *)info;
            for (CFIndex i = 0; i < CFArrayGetCount(serverContext->clients); i++) {
                Client *client = (Client *)CFArrayGetValueAtIndex(serverContext->clients, i);
                CFWriteStreamWrite(client->writeStream, buffer, bytesRead);
            }
        }
    }
}
