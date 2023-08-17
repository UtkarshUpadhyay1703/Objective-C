//
//  ViewController.m
//  NotificationApi
//
//  Created by admin on 17/05/23.
//
#import <CoreServices/CoreServices.h>
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createFileEventStream];
    [self startFileEventStream];
    
    
    //App launch event
    [[[NSWorkspace sharedWorkspace]notificationCenter]addObserver:self selector:@selector(appLaunchNotification:) name:NSWorkspaceDidLaunchApplicationNotification object:nil];
    
    //App Tremination event
    [[[NSWorkspace sharedWorkspace]notificationCenter]addObserver:self selector:@selector(appTerminationNotification:) name:NSWorkspaceDidTerminateApplicationNotification object:nil];
    
    //screen sleep event
    [[[NSWorkspace sharedWorkspace]notificationCenter] addObserver:self selector:@selector(screenSleepNotification:) name:NSWorkspaceScreensDidSleepNotification object:nil];
    
    //screen awak event
    [[[NSWorkspace sharedWorkspace]notificationCenter] addObserver:self selector:@selector(screenAwakNotification:) name:NSWorkspaceDidWakeNotification object:nil];
    
    //Lock event
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(appLockNotification:) name:@"com.apple.screenIsLocked" object:nil];

    //unlock event
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(appUnlockNotification:) name:@"com.apple.screenIsUnlocked" object:nil];

    
    
    self.fileManager = [NSFileManager defaultManager];
    NSURL *appLoction = [NSURL fileURLWithPath:@"/Users/admin/Desktop/Bindings Api/Bindings.App"];
    NSArray *keys = @[NSURLIsDirectoryKey];
       
          NSDirectoryEnumerator *enumerator = [self.fileManager enumeratorAtURL:appLoction includingPropertiesForKeys:keys options:NSDirectoryEnumerationSkipsHiddenFiles errorHandler:nil];
    
        for (NSURL *url in enumerator) {
           NSError *error;
           NSDictionary *resourceValues = [url resourceValuesForKeys:keys error:&error];
           if (resourceValues[NSURLIsDirectoryKey]) {
               [self.fileManager startDownloadingUbiquitousItemAtURL:url error:nil];
             }
         }

    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(void)appLaunchNotification:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
        NSRunningApplication *app = userInfo[NSWorkspaceApplicationKey];
        NSString *appName = app.localizedName;
        pid_t processID = app.processIdentifier;
    NSDate *date = [NSDate date];
        NSLog(@"App Launch: %@, Process ID: %i, Time: %@", appName, processID, date);
}

-(void)appTerminationNotification:(NSNotification *)notification{
    NSDictionary *appInfo = notification.userInfo;
    NSRunningApplication *app = appInfo[NSWorkspaceApplicationKey];
    NSString *appName = app.localizedName;
    pid_t processID = app.processIdentifier;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"App terminated: %@ , Process Id : %i, Time: %@", appName, processID, time);
}

-(void)appLockNotification:(NSNotification *)notification{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Screen Locked at time %@",time);
}

-(void)appUnlockNotification:(NSNotification *)notification{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"Screen unlocked at time %@",time);
}
-(void)screenSleepNotification:(NSNotification *)notification{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"sleep Time: %@",time);
}

-(void)screenAwakNotification:(NSNotification *)notification{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"Awak Time: %@",time);
}

void fileEventHandler(ConstFSEventStreamRef streamRef,
                      void *clientInfo,
                      size_t numEvents,
                      void *eventPaths,
                      const FSEventStreamEventFlags eventFlags[],
                      const FSEventStreamEventId eventIDs[]) {
    for (size_t i = 0; i < numEvents; i++) {
        char **paths = eventPaths;
        NSString *eventPath = [NSString stringWithUTF8String:paths[i]];
        FSEventStreamEventFlags flag = eventFlags[i];
        FSEventStreamEventId eventID = eventIDs[i];
        
        if (flag & kFSEventStreamEventFlagItemCreated) {
            NSLog(@"File created: %@,%llu", eventPath, eventID);
            // Handle file creation event
        }
        
        if (flag & kFSEventStreamEventFlagItemRenamed) {
            NSLog(@"File renamed: %@, %llu", eventPath, eventID);
            // Handle file rename event
        }
        
        if (flag & kFSEventStreamEventFlagItemRemoved) {
            NSLog(@"File removed: %@, %llu", eventPath, eventID);
            // Handle file delete event
        }
        
        if (flag & kFSEventStreamEventFlagItemModified) {
            NSLog(@"File modified: %@, %llu", eventPath, eventID);
            // Handle file modify event
        }
    }
}

- (void)createFileEventStream {
    
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop"];
    NSArray *pathsToWatch = @[path];
    FSEventStreamContext context;
    
    context.version = 3;
    context.info = NULL;
    context.retain = NULL;
    context.release = NULL;
    context.copyDescription = NULL;
    
    self.eventStream = FSEventStreamCreate(NULL,
                                      &fileEventHandler,
                                      &context,
                                      (__bridge CFArrayRef)pathsToWatch,
                                      kFSEventStreamEventIdSinceNow,
                                      1.0,
                                      kFSEventStreamCreateFlagFileEvents);
}

- (void)startFileEventStream {
    if (_eventStream) {
        FSEventStreamScheduleWithRunLoop(_eventStream,
                                         CFRunLoopGetCurrent(),
                                         kCFRunLoopDefaultMode);
        
        FSEventStreamStart(_eventStream);
    }
}

- (void)stopFileEventStream {
    if (_eventStream) {
        FSEventStreamStop(_eventStream);
        FSEventStreamInvalidate(_eventStream);
        FSEventStreamRelease(_eventStream);
        _eventStream = NULL;
    }
}


- (void)viewWillDisappear:(BOOL)animated {
    //[super viewWillDisappear:animated];
    [self stopFileEventStream];
}





@end
