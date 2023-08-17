//
//  ViewController.h
//  AssignmentWithNotification
//
//  Created by admin on 5/17/23.
//

#import <Cocoa/Cocoa.h>
//#import <sys/event.h>
#import <CoreServices/CoreServices.h>
@interface ViewController : NSViewController<NSApplicationDelegate, NSFileManagerDelegate>

@property NSFileManager *fileManager;
@property (nonatomic, assign) FSEventStreamRef eventStream;

//This code defines an interface for a view controller class ViewController. The class adopts two protocols, NSApplicationDelegate and NSFileManagerDelegate, which define methods that the class must implement.
//
//The class also has two properties:
//
//fileManager - an instance of NSFileManager, which is a class that provides a way to interact with the file system. This property allows the view controller to access file system operations.
//
//eventStream - an instance of FSEventStreamRef, which is a type of object used to monitor file system events. This property allows the view controller to create and manage a stream of file system events.
//
//By declaring the fileManager and eventStream properties in the interface, the class can create instances of these objects and use them throughout its implementation.

@end

