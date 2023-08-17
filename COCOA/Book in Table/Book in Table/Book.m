//
//  Book.m
//  Book in Table
//
//  Created by admin on 5/10/23.
//

#import "Book.h"

@implementation Book

-(NSArray *)author{
    if(!_author){
        _author=@[@"Arun Tiwari",@"Mahatma Gandhi"];
    }
    return _author;
}
-(NSArray *)title{
    if(!_title){
        _title=@[@"Wings Of Fire",@"My Experiments With Truth"];
    }
    return _title;
}
-(NSArray *)date{
    if(!_date){
        _date=@[[NSDate date],[[NSDate alloc] initWithTimeIntervalSinceNow:1000]];
    }
    return _date;
}
-(NSArray *)pageCount{
    if(!_pageCount){
        _pageCount=@[@"288",@"499"];
    }
    return _pageCount;
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *) tableView{
    return self.author.count;
}
-(NSView *)tableView:(NSTableView * )tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier=tableColumn.identifier;
    NSTableCellView *cell=[tableView makeViewWithIdentifier:identifier owner:self];
    if([identifier isEqualToString:@"author"]){
        cell.textField.stringValue = [self.author objectAtIndex:row];
    }else if ([identifier isEqualToString:@"title"]){
        cell.textField.stringValue=[self.title objectAtIndex:row];
    }else if ([identifier isEqualToString:@"date"]){
        cell.textField.stringValue=[self.date objectAtIndex:row];
    }else{
        cell.textField.stringValue=[self.pageCount objectAtIndex:row];
    }
    return cell;
}
@end
