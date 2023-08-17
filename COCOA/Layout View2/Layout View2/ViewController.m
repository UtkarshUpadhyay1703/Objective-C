//
//  ViewController.m
//  Layout View2
//
//  Created by admin on 5/8/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    // Do any additional setup after loading the view.
//    self.allBooks =[[NSMutableArray alloc]init];
//    Book *firstBook = [[Book alloc]init];
//    [firstBook setAuthor:@"Chetan Bhagat"];
//    [firstBook setTitle:@"Half GF"];
//    [firstBook setPageCount:150];
//    [self.allBooks insertObject:firstBook atIndex:[self.allBooks count]];
//
//    //OR
//
//    Book *secondBook=[[Book alloc]init];
//    secondBook.author=@"Arun Tiwari";
//    secondBook.title=@"Wings Of Fire";
//    secondBook.pageCount=228;
//    [self.allBooks insertObject:secondBook atIndex:[self.allBooks count]];
//
//    //OR this method is known as key-value method;
//
//    Book *thirdBook=[[Book alloc]init];
//    [thirdBook setValue:@"Mahatma Gandhi" forKey:@"author"];
//    [thirdBook setValue:@"My Experiments With Truth" forKey:@"title"];
//    [thirdBook setValue:[NSNumber numberWithInt:499] forKey:@"pageCount"];
//    [self.allBooks insertObject:thirdBook atIndex:[self.allBooks count]];
    
//    self.singleBook = [[Book alloc]init];
//    [self.singleBook setAuthor:@"asdf"];
//    [self.singleBook setTitle:@"lkjh"];
//    [self.singleBook setPublishedDate:[NSDate date]];
//    [self.singleBook setPageCount:315];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


NSArray *languages;

-(void) awakeFromNib{
    languages=[NSLocale preferredLanguages];
}

  //Methods of Table data Source.
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return  [languages count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row{
    return  [languages objectAtIndex:row];
}



//- (IBAction)listAllBooks:(id)sender {
//    for(Book *currentBook in self.allBooks){
//        NSLog(@"the book %@ by %@ has %i pages",currentBook.title,currentBook.author,currentBook.pageCount);
//    }
//
//    //OR we have method to print via key-value pair.
//
//    for(Book *currentBook in self.allBooks){
//        NSLog(@"The books %@ by %@ has %@ pages",[currentBook valueForKey:@"title"],[currentBook valueForKey:@"author"],[currentBook valueForKey:@"pageCount"]);
//    }
////    NSLog(@"author = %@",self.singleBook.author);
//}
@end
