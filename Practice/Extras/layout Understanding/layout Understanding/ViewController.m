//
//  ViewController.m
//  layout Understanding
//
//  Created by admin on 5/26/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize img,segOut;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)segAct:(id)sender {
    switch (segOut.selectedSegmentIndex) {
        case 0:
            img.image = [UIImage imageNamed:@"One"];
            break;
        case 1:
            img.image = [UIImage imageNamed:@"Two"];
            break;
        case 2:
            img.image = [UIImage imageNamed:@"Three"];
            break;
        case 3:
            img.image = [UIImage imageNamed:@"Four"];
            break;
        default:
            break;
    }
}
@end
