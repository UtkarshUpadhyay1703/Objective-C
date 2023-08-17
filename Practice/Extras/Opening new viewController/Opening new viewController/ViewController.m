//
//  ViewController.m
//  Opening new viewController
//
//  Created by admin on 6/9/23.
//

#import "ViewController.h"
#import "second.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)callingNextView:(id)sender {
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    second *chatViewController = [storyboard instantiateControllerWithIdentifier:@"second"];
    
//    [self.view.window close];
    [self presentViewControllerAsModalWindow:chatViewController];
}
@end
