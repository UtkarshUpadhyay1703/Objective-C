//
//  ViewController.m
//  AlertsUsage
//
//  Created by admin on 5/4/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)createAlertSheet:(id)sender {
    NSAlert *myAlert=[[NSAlert alloc] init];
    
    [myAlert addButtonWithTitle:@"OK"];
    [myAlert addButtonWithTitle:@"Cancel"];
    [myAlert setMessageText:@"Alert Message"];
    [myAlert setInformativeText:@"This is the new way of declaring the alert that is alert sheet"];
    [myAlert setAlertStyle:NSAlertStyleWarning];
    
    NSWindow *window=[[NSApplication sharedApplication] mainWindow];
    [myAlert beginSheetModalForWindow:window completionHandler:^(NSModalResponse result){
     if(result == NSAlertFirstButtonReturn) NSLog(@"OK");
        else if(result ==NSAlertSecondButtonReturn) NSLog(@"Cancel");
        else NSLog(@"Invalid button typed");
    }];
    [window setBackgroundColor:[NSColor greenColor]];
    
}

- (IBAction)createAlertPanel:(id)sender {
    NSInteger result=NSRunAlertPanel(@"Title", @"Basic alert message", @"OK", @"Alternate", @"Other");
    NSLog(@"Result = %li",(long)result);
}
@end
