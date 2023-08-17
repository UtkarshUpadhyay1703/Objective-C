//
//  ViewController.h
//  PopOver Test
//
//  Created by admin on 6/19/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSPopoverTouchBarItem *popover;
@property (weak) IBOutlet NSView *window;
- (IBAction)pushed:(id)sender;

@property (strong) NSStatusItem *statusItem;
@property (strong) IBOutlet NSMenu *menu;
- (IBAction)first:(id)sender;
- (IBAction)second:(id)sender;


@end

