//
//  Person.m
//  Display Name with id
//
//  Created by admin on 5/10/23.
//

#import "Person.h"
@implementation Person

//-(void)awak
-(NSArray *) ids{
    if(!_ids){
        _ids=@[@"1",@"2",@"3"];
    }
    return _ids;
}
-(NSArray *) names{
    if(!_names){
        _names=@[@"Aniket",@"Suraj",@"Utkarsh"];
    }
    return _names;
}
-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView{
    return self.ids.count;
}
-(NSView *) tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier=tableColumn.identifier;
    NSTableCellView *cell=[tableView makeViewWithIdentifier:identifier owner:self];
    if([identifier isEqualToString:@"ids"]){
        cell.textField.stringValue=[self.ids objectAtIndex:row];
    }else{
        cell.textField.stringValue=[self.names objectAtIndex:row];
    }
    return cell;
}

@end
