//
//  main.m
//  Chat App Real Server
//
//  Created by admin on 6/5/23.
//

//#import <Cocoa/Cocoa.h>
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//    }
//    return NSApplicationMain(argc, argv);
//}

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

// Define the callback function for handling incoming connections
void AcceptConnection(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a socket context
        CFSocketContext socketContext = {0, NULL, NULL, NULL, NULL};

        // Create a TCP socket
        CFSocketRef socket = CFSocketCreate(
            kCFAllocatorDefault,
            PF_INET,
            SOCK_STREAM,
            IPPROTO_TCP,
            kCFSocketAcceptCallBack,
            (CFSocketCallBack)&AcceptConnection,
            &socketContext
        );

        // Set socket options (e.g., reuse address)
        int reuse = 1;
        setsockopt(CFSocketGetNative(socket), SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));

        // Create a sockaddr_in structure for binding
        struct sockaddr_in addr;
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
    }
    return 0;
}

// Callback function for handling incoming connections
void AcceptConnection(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info) {
    // Handle incoming connections and messages here
}

