//
//  ViewController.m
//  MyFirstApplication_HandelingEventNotification
//
//  Created by Admin on 5/16/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Register for app launch event
        [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                             selector:@selector(appDidLaunch:)
                                                                 name:NSWorkspaceDidLaunchApplicationNotification
                                                               object:nil];
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
    
    // Register for lock & unlock events using NSDistributedNotificationCenter
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                            selector:@selector(screenDidLock:)
                                                                name:@"com.apple.screenIsLocked"
                                                              object:nil];
        
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                            selector:@selector(screenDidUnlock:)
                                                                name:@"com.apple.screenIsUnlocked"
                                                              object:nil];
       // Monitor file events
       self.fileManager= [NSFileManager defaultManager];
       NSURL *directoryURL = [NSURL fileURLWithPath:@"/Users/admin/Desktop/icon.icns"];
   
       NSArray *keys = @[NSURLIsDirectoryKey];
       
       NSDirectoryEnumerator *enumerator = [self.fileManager enumeratorAtURL:directoryURL
                                                   includingPropertiesForKeys:keys
                                                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                 errorHandler:nil];
       
       for (NSURL *url in enumerator) {
           NSError *error;
           NSDictionary *resourceValues = [url resourceValuesForKeys:keys error:&error];
           if (resourceValues[NSURLIsDirectoryKey]) {
               [self.fileManager startDownloadingUbiquitousItemAtURL:url error:nil];
           }
       }
}



- (void)appDidLaunch:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSRunningApplication *app = userInfo[NSWorkspaceApplicationKey];
    NSString *appName = app.localizedName;
    pid_t processID = app.processIdentifier;
    NSLog(@"App Launch: %@, Process ID: %d, Time: %@", appName, processID, [NSDate date]);
}


- (void)appDidTerminate:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSRunningApplication *app = userInfo[NSWorkspaceApplicationKey];
    NSString *appName = app.localizedName;
    pid_t processID = app.processIdentifier;
    NSLog(@"App Termination: %@, Process ID: %d, Time: %@", appName, processID, [NSDate date]);
}

- (void)screenDidSleep:(NSNotification *)notification {
    NSLog(@"Screen Did Sleep, Time: %@", [NSDate date]);
}

- (void)screenDidWake:(NSNotification *)notification {
    NSLog(@"Screen Did Wake, Time: %@", [NSDate date]);
}

- (void)screenDidLock:(NSNotification *)notification {
    NSLog(@"Screen Did Lock, Time: %@", [NSDate date]);
}

- (void)screenDidUnlock:(NSNotification *)notification {
    NSLog(@"Screen Did Unlock, Time: %@", [NSDate date]);
}


- (void)fileManager:(NSFileManager *)fileManager didChangeItemAtURL:(NSURL *)url {
    NSString *fileName = url.lastPathComponent;
    NSFileAttributeType type;
    
    BOOL isDirectory;
       [fileManager fileExistsAtPath:url.path isDirectory:&isDirectory];
       type = isDirectory ? NSFileTypeDirectory : NSFileTypeRegular;
    
    
    NSString *eventType;
    
    if (type == NSFileTypeRegular) {
        eventType = @"Modify";
    } else if (type == NSFileTypeDirectory) {
        eventType = @"Create";
    } else {
        eventType = @"Unknown";
    }
    
    NSLog(@"File Event: %@, Type: %@, Time: %@", fileName, eventType, [NSDate date]);
}






- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}




@end
