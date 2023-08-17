//
//  AppDelegate.m
//  Chat App DN Teacher
//
//  Created by admin on 6/5/23.
//

//#import "AppDelegate.h"
//
//@interface AppDelegate ()
//
//
//@end
//
//@implementation AppDelegate
//
//- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    // Insert code here to initialize your application
//}
//
//
//- (void)applicationWillTerminate:(NSNotification *)aNotification {
//    // Insert code here to tear down your application
//}
//
//
//- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
//    return YES;
//}
//

//@end

#import "AppDelegate.h"


@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self showLoginWindow];
}

- (void)showLoginWindow {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Enter Teacher Username"];
    [alert addButtonWithTitle:@"Login"];
    [alert setAlertStyle:NSAlertStyleInformational];
    
    NSTextField *usernameTextField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 24)];
    [usernameTextField setStringValue:@"Teacher"];
    [alert setAccessoryView:usernameTextField];
    
    __weak typeof(self) weakSelf = self;
    [alert beginSheetModalForWindow:nil completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSAlertFirstButtonReturn) {
            NSString *username = usernameTextField.stringValue;
            [weakSelf showTeacherChatWindowWithUsername:username];
        }
    }];
}

//- (void)showTeacherChatWindowWithUsername:(NSString *)username {
//    self.teacherChatWindowController = [[TeacherChatWindowController alloc] initWithWindowNibName:@"TeacherChatWindowController" bundle:nil];
//    self.teacherChatWindowController.window.title = [NSString stringWithFormat:@"Teacher Chat - %@", username];
//    [self.teacherChatWindowController showWindow:self];
//}
- (void)showTeacherChatWindowWithUsername:(NSString *)username {
    self.teacherChatWindowController = [[TeacherChatWindowController alloc] initWithWindowNibName:@"TeacherChatWindowController"];
    self.teacherChatWindowController.window.title = [NSString stringWithFormat:@"Teacher Chat - %@", username];
    [self.teacherChatWindowController showWindow:self];
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end


