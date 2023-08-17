//
//  ViewController.m
//  Internet Based Sender
//
//  Created by admin on 6/12/23.
//

#import "ViewController.h"
#import "ChatController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    ChatController *chatViewController = [storyboard instantiateControllerWithIdentifier:@"ChatController"];
    [self presentViewControllerAsModalWindow:chatViewController];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
