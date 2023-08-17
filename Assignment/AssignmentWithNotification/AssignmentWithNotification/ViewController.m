//
//  ViewController.m
//  AssignmentEvents
//
//  Created by admin on 5/16/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createFileEventStream];
    [self startFileEventStream];
    
    
    // Register for app launch event
        [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                             selector:@selector(appDidLaunch:)
                                                                 name:NSWorkspaceDidLaunchApplicationNotification
                                                               object:nil];
    
//    This line of code adds an observer to the shared notification center of the current NSWorkspace instance. It observes the notification with name "NSWorkspaceDidLaunchApplicationNotification" and will call the selector "appDidLaunch" when this notification is posted. Here is a breakdown of the individual parts of this line of code:
//
//    NSWorkspace sharedWorkspace: This retrieves the shared instance of the NSWorkspace class. This class provides access to information about the current user's desktop and running applications.
//
//    notificationCenter: This retrieves the notification center associated with the shared NSWorkspace instance. A notification center is a mechanism in Cocoa for broadcasting events and sending notifications between different objects.
//
//    addObserver:self: This adds the object that is calling this line of code as an observer of the notification center. In this case, self refers to the current object.
//
//    selector:@selector(appDidLaunch:): This specifies the selector that should be called when the notification is received. In this case, the selector is appDidLaunch:. The @selector keyword is used to create a selector from a string.
//
//    name:NSWorkspaceDidLaunchApplicationNotification: This specifies the name of the notification to observe. In this case, the name is NSWorkspaceDidLaunchApplicationNotification, which is sent by the NSWorkspace when a new application is launched.
//
//    object:nil: This specifies the object that is sending the notification. In this case, nil is used to indicate that any object can send the notification.
    
    
    
    //Register for app Terminate event
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                            selector:@selector(appDidTerminate:)
                                                                name:NSWorkspaceDidTerminateApplicationNotification
                                                              object:nil];
       
    
    // Register for sleep
       [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                            selector:@selector(screenDidSleep:)
                                                                name:NSWorkspaceScreensDidSleepNotification
                                                              object:nil];
    // Register for Awake
       [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                            selector:@selector(screenDidWake:)
                                                                name:NSWorkspaceScreensDidWakeNotification
                                                              object:nil];
 
    // Register for lock event using NSDistributedNotificationCenter
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                            selector:@selector(screenDidLock:)
                                                                name:@"com.apple.screenIsLocked"
                                                              object:nil];
    // Register for unlock event using NSDistributedNotificationCenter
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                            selector:@selector(screenDidUnlock:)
                                                                name:@"com.apple.screenIsUnlocked"
                                                              object:nil];
}//Ending

- (void)appDidLaunch:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSRunningApplication *app = userInfo[NSWorkspaceApplicationKey];
    NSString *appName = app.localizedName;
    pid_t processID = app.processIdentifier;
    //Date formatter
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"App Launch: %@, Process ID: %d, Time: %@", appName, processID, time);
}

- (void)appDidTerminate:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSRunningApplication *app = userInfo[NSWorkspaceApplicationKey];
    NSString *appName = app.localizedName;
    pid_t processID = app.processIdentifier;
    //Time from date via date formatter
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"App Termination: %@, Process ID: %d, Time: %@", appName, processID, time);
}

- (void)screenDidSleep:(NSNotification *)notification {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Screen Did Sleep, Time: %@", time);
}

- (void)screenDidWake:(NSNotification *)notification {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Screen Did Wake, Time: %@", time);
}

- (void)screenDidLock:(NSNotification *)notification {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Screen Did Lock, Time: %@", time);
}

- (void)screenDidUnlock:(NSNotification *)notification {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Screen Did Unlock, Time: %@", time);
}

//file operation methods
static void fileEventHandler(ConstFSEventStreamRef stream,
                     void *clientCallBackInfo,
                     size_t numEvents,
                     void *eventPathsVoidPointer,
                     const FSEventStreamEventFlags eventFlags[],
                     const FSEventStreamEventId eventIds[]) {
    char **paths = eventPathsVoidPointer;
    for (int i=0; i<numEvents; i++) {
        NSString *path = [NSString stringWithUTF8String:paths[i]];
        NSString *fileName = [path lastPathComponent];
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"HH:mm:ss"];
        NSString *time=[dateFormatter stringFromDate:[NSDate date]];
        if (eventFlags[i] & kFSEventStreamEventFlagItemCreated) {
            NSLog(@"File '%@' at path '%@' was created at time = %@.", fileName, path,time);
        } else if (eventFlags[i] & kFSEventStreamEventFlagItemRemoved) {
            NSLog(@"File '%@' at path '%@' was deleted at time = %@.", fileName, path,time);
        } else if (eventFlags[i] & kFSEventStreamEventFlagItemRenamed) {
            NSLog(@"File '%@' at path '%@' was renamed at time = %@.", fileName, path,time);
        } else if (eventFlags[i] & kFSEventStreamEventFlagItemModified) {
            NSLog(@"File '%@' at path '%@' was modified at time = %@.", fileName, path,time);
        }
    }
}

- (void)createFileEventStream {
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop"];
    NSArray *pathsToWatch = @[path];
    FSEventStreamContext context;
    context.version = 0;
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

//- (void)stopFileEventStream {
//    if (_eventStream) {
//        FSEventStreamStop(_eventStream);
//        FSEventStreamInvalidate(_eventStream);
//        FSEventStreamRelease(_eventStream);
//        _eventStream = NULL;
//    }
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    //[super viewWillDisappear:animated];
//    [self stopFileEventStream];
//}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
@end
