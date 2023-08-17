//
//  ViewController.m
//  BasicInteraction
//
//  Created by admin on 5/4/23.
//

#import "ViewController.h"

@implementation ViewController

@synthesize textField;
@synthesize myLabel;
-(IBAction) changeLable:(id)sender{
    NSString *message=[[NSString alloc]initWithFormat:@"Hello, %@",[textField stringValue]];
    [myLabel setStringValue:message];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)changeLabel:(id)sender {
    NSString *message=[[NSString alloc] initWithFormat:@"Hello %@",[textField stringValue]];
    [myLabel setStringValue:message];
}
@end
