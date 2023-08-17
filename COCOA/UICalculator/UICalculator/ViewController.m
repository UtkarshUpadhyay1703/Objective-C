//
//  ViewController.m
//  UICalculator
//
//  Created by admin on 5/11/23.
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


- (IBAction)add:(id)sender {
    int res=[self.number1 intValue]+[self.number2 intValue];
    [self.result setIntValue:res];
}
@end
