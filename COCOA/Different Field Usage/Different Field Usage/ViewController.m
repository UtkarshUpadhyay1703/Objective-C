//
//  ViewController.m
//  Different Field Usage
//
//  Created by admin on 5/5/23.
//

#import "ViewController.h"

@implementation ViewController
@synthesize textField,tokenField,TodaysDate,numberLabel;
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSDate *today = [NSDate date];
    [TodaysDate setObjectValue:today];
    float num=111.11;
    [numberLabel setFloatValue:num];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)tokenCheck:(id)sender {
    NSLog(@"token value = %@",[tokenField stringValue]);
}

- (IBAction)Check:(id)sender {
    NSString *arr[]={[textField stringValue]};
    NSLog(@"Text field value = %@",arr[0]);
}

- (IBAction)pressToShowDate:(id)sender {
    NSDate *date=[NSDate date];
    [_showDate setObjectValue:date];
}



@end
