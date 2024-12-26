//
//  TableHelperClass.m
//  TableViewController
//
//  Created by admin on 10/05/23.
//

#import "TableHelperClass.h"

@implementation TableHelperClass

-(void)awakeFromNib{
    
    Book *firstBook = [[Book alloc] initWithTitle:@"Atomic habits" author:@"james" pageCount:256];
    
    
    
    Book *secondBook = [[Book alloc] initWithTitle:@"Rich Dad Poor Dad" author:@"james H." pageCount:286];
    
    self.allBooks = [NSArray arrayWithObjects:firstBook,secondBook, nil];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"%li",[self.allBooks count]);
    return [self.allBooks count];
    
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSString *identifier = tableColumn.identifier;
    NSLog(@"%@",identifier);
        NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
   
    NSLog(@"%li",row);
    
    if([identifier isEqualToString:@"title"]){
        NSLog(@"%li",row);
        Book *currentBook = [self.allBooks objectAtIndex:row];
        NSLog(@"%@",[currentBook title]);
        NSString *title1 = currentBook.title;
        NSLog(@"%@",title1);
        cell.textField.stringValue = title1;
    }
    
    else if([identifier isEqualToString:@"author"]){
        
        Book *currentBook = [self.allBooks objectAtIndex:row];
        
        NSString *title1 = currentBook.author;
        cell.textField.stringValue = title1;
    }
    
    else if([identifier isEqualToString:@"pageCount"]){
        Book *currentBook = [self.allBooks objectAtIndex:row];
    
        NSLog(@"%@",[currentBook title]);
        
        int title1 = currentBook.pageCount;
        cell.textField.integerValue = title1;
    }
    
    return cell;
}

@end
