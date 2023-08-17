//
//  main.m
//  CFSocket Client
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

#define kBufferSize 1024

// Callback function for handling read events
void HandleReadStream(CFReadStreamRef stream, CFStreamEventType eventType, void *info);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a TCP socket
        CFReadStreamRef readStream;
        CFWriteStreamRef writeStream;
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, CFSTR("192.168.10.152"), 1234, &readStream, &writeStream);

        // Set up read stream
        CFStreamClientContext clientContext = {0, NULL, NULL, NULL, NULL};
        CFReadStreamSetClient(readStream, kCFStreamEventHasBytesAvailable, HandleReadStream, &clientContext);
        CFReadStreamScheduleWithRunLoop(readStream, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
        CFReadStreamOpen(readStream);

        // Set up write stream
        CFWriteStreamSetProperty(writeStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
        CFWriteStreamOpen(writeStream);

        // Send messages to the server
        char message[kBufferSize];
        while (fgets(message, kBufferSize, stdin)) {
            CFWriteStreamWrite(writeStream, (const UInt8 *)message, strlen(message));
        }

        // Clean up resources
        CFReadStreamClose(readStream);
        CFReadStreamUnscheduleFromRunLoop(readStream, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
        CFWriteStreamClose(writeStream);
    }
    return 0;
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
        }
    }
}
