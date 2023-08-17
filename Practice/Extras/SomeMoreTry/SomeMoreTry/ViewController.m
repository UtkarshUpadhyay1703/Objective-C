//
//  ViewController.m
//  SomeMoreTry
//
//  Created by admin on 5/30/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.dic = [NSMutableDictionary dictionary];
    [self.dic setValue:@"jjj" forKey:@"j"];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"Count = %li",[self.dic count]);
    return [self.dic count];
}
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier = tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
    
    NSArray *keys = [self.dic allKeys];
    if(row >=0 && row < [keys count]){
        NSString *key = keys[row];
        if([identifier isEqualToString:@"name"]){
            NSString *name = key;
            cell.textField.stringValue = name;
        }else if ([identifier isEqualToString:@"age"]){
            NSString *age = self.dic[key];
            cell.textField.stringValue = age;
        }else NSLog(@"Not working");
    }
    return cell;
}


@end
