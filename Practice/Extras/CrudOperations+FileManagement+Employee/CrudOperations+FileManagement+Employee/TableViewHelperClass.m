//
//  TableViewHelperClass.m
//  Dictionary+TableView+FileManagement
//
//  Created by admin on 5/30/23.
//

#import "TableViewHelperClass.h"

@implementation TableViewHelperClass
- (void)awakeFromNib{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    self.filePath = [documentDirectory stringByAppendingPathComponent:@"Crud.plist"];
    
    self.allEmployees = [NSMutableDictionary dictionaryWithContentsOfFile:self.filePath];
    if (_allEmployees == nil) {
        _allEmployees = [NSMutableDictionary dictionary];
    }
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"Count = %li",[_allEmployees count]);
    return [_allEmployees count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier = tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
    
    NSArray *keys = [self.allEmployees allKeys];
    if(row >=0 && row < [keys count]){
        NSString *key = keys[row];
        if([identifier isEqualToString:@"name"]){
            NSString *name = key;
            cell.textField.stringValue = name;
        }else if ([identifier isEqualToString:@"age"]){
            NSString *age = self.allEmployees[key];
            cell.textField.stringValue = age;
        }else NSLog(@"Not working");
    }
    return cell;
}
    

@end
