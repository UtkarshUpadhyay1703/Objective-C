//
//  ViewController.m
//  SandBoxing
//
//  Created by admin on 5/10/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSURLRequest *firstRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]];
    [self.myWebView loadRequest:firstRequest];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
