//
//  ViewController.h
//  NotificationApi
//
//  Created by admin on 17/05/23.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController <NSApplicationDelegate, NSFileManagerDelegate>

@property NSFileManager *fileManager;

@property (nonatomic, assign) FSEventStreamRef eventStream;

@end

