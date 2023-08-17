//
//  ViewController.m
//  Single View
//
//  Created by admin on 5/9/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.singleBook = [[Book alloc]init];
    [self.singleBook setAuthor:@"Arun Tiwari"];
    [self.singleBook setTitle:@"Wings Of Fire"];
    [self.singleBook setDate:[NSDate date]];
    [self.singleBook setPageCount:228];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
