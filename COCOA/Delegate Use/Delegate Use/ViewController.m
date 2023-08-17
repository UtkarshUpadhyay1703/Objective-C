//
//  ViewController.m
//  Delegate Use
//
//  Created by admin on 5/5/23.
//

#import "ViewController.h"

@implementation ViewController

@synthesize effectButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)doSomething:(id)sender {
    [effectButton setEnabled:YES];
}

//- (IBAction)seeChange:(id)sender {
//    NSLog(@"You have changed the color");
//}

-(void)comboBoxSelectionDidChange:(NSNotification *)notification{
    NSLog(@"THIS is the main thing that a person do as delegate. %@    &&&& %@ ",[notification name],[notification object]);
    
}
@end
