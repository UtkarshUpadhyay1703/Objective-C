//
//  AppDelegate.m
//  Delegate Use
//
//  Created by admin on 5/5/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (void)applicationWillBecomeActive:(NSNotification *)notification{
    NSLog(@"This is when application is active");
}



@end
