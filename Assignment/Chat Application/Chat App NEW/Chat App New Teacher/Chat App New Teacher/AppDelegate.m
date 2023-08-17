//
//  AppDelegate.m
//  Chat App New Teacher
//
//  Created by admin on 6/2/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSConnection *connection = [NSConnection defaultConnection];
    ChatManager *chatManager = [[ChatManager alloc] init];
    [connection setRootObject:chatManager];
    BOOL success = [connection registerName:@"TeacherChatApp"];
    if (!success) {
        NSLog(@"Failed to register connection");
    }

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
