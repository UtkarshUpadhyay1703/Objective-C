//
//  ViewController.m
//  PopOver Test
//
//  Created by admin on 6/19/23.
//

#import "ViewController.h"

@implementation ViewController
@synthesize menu;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)awakeFromNib{
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [_statusItem setMenu:menu];
    [_statusItem setTitle:@"Yoda Bar"];
    [_statusItem setHighlightMode:YES];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)pushed:(id)sender {
    
}
- (IBAction)second:(id)sender {
    NSLog(@"Second");
    [NSApp terminate:nil];
}

- (IBAction)first:(id)sender {
    NSLog(@"First");
    [NSApp activateIgnoringOtherApps:YES];
}
@end
