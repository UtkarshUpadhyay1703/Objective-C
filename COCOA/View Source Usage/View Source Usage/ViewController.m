//
//  ViewController.m
//  View Source Usage
//
//  Created by admin on 5/9/23.
//

#import "ViewController.h"

@implementation ViewController
//NSArray *languages;
//NSArray *places;
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.places = [NSArray arrayWithObjects:@"Pune", @"Mumbai",@"Mathura", nil];
//
//    languages=[NSLocale preferredLanguages];
//    NSLog(@"language count = %lu",(unsigned long)[languages count]);
    
    //OR
    
//    self.tableView.dataSource=self;
    
    
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
//    NSLog(@"language count = %lu",(unsigned long)[languages count]);
//    return  [languages count];
    return [self.places count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row{
//    NSLog(@"language count = %lu and row= %@",(unsigned long)[languages count],[languages objectAtIndex:row]);
//    return  [languages objectAtIndex:row];
    
    //OR
    NSLog(@"place = %@",[self.places objectAtIndex:row]);
    return [self.places objectAtIndex:row];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
