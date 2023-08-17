//
//  AppDelegate.h
//  Chat App Teacher
//
//  Created by admin on 6/1/23.
//

#import <Cocoa/Cocoa.h>
#import "TeacherChatViewController.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) TeacherChatViewController *chatViewController;

@end

