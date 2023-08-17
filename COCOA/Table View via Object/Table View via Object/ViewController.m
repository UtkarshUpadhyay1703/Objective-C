//
//  ViewController.m
//  Table View via Object
//
//  Created by admin on 5/10/23.
//

#import "ViewController.h"
#import "Book.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
//    self.allBooks =[[NSArray alloc]init];
    Book *secondBook=[[Book alloc]init];
    secondBook.author=@"Arun Tiwari";
    secondBook.title=@"Wings Of Fire";
    secondBook.date=[NSDate date];
    secondBook.pageCount=228;
//    [self.allBooks insertObject:secondBook atIndex:[self.allBooks count]];
    
   
   
    Book *thirdBook=[[Book alloc]init];
    [thirdBook setValue:@"Mahatma Gandhi" forKey:@"author"];
    [thirdBook setValue:@"My Experiments With Truth" forKey:@"title"];
    [thirdBook setValue:[[NSDate alloc]initWithTimeIntervalSinceNow:100] forKey:@"date"];
    [thirdBook setValue:[NSNumber numberWithInt:499] forKey:@"pageCount"];
//    [self.allBooks insertObject:thirdBook atIndex:[self.allBooks count]];
   
    self.allBooks=[[NSArray alloc]initWithObjects:secondBook,thirdBook, nil];
    
    NSLog(@"Done INIT");
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.allBooks count];
}
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSLog(@"----------------");
    NSString *identifier=tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
    if([identifier isEqualToString:@"author"]){
        cell.textField.stringValue=[[self.allBooks objectAtIndex:row] author];
    }else if ([identifier isEqualToString:@"title"]){
        cell.textField.stringValue=[[self.allBooks objectAtIndex:row] title];
    }else if ([identifier isEqualToString:@"date"]){
        cell.textField.stringValue=[[self.allBooks objectAtIndex:row] date];
    }else{
        Book *currentBook = [self.allBooks objectAtIndex:row];
        int title1 = currentBook.pageCount;
        cell.textField.integerValue = title1;
//        cell.textField.integerValue=title1;
    }
    return cell;
}

@end
