//
//  ViewController.m
//  BindingTableViewsTry
//
//  Created by admin on 5/9/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.allBooks=[[NSMutableArray alloc]init];
    Book *secondBook=[[Book alloc]init];
    secondBook.author=@"Arun Tiwari";
    secondBook.title=@"Wings Of Fire";
    secondBook.pageCount=228;
    [self.allBooks insertObject:secondBook atIndex:[self.allBooks count]];
    
    //OR this method is known as key-value method;
    
    Book *thirdBook=[[Book alloc]init];
    [thirdBook setValue:@"Mahatma Gandhi" forKey:@"author"];
    [thirdBook setValue:@"My Experiments With Truth" forKey:@"title"];
    [thirdBook setValue:[NSNumber numberWithInt:499] forKey:@"pageCount"];
    [self.allBooks insertObject:thirdBook atIndex:[self.allBooks count]];

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)showAllBooks:(id)sender {
    for(Book *currentBook in self.allBooks){
        NSLog(@"The books %@ by %@ has %@ pages",[currentBook valueForKey:@"title"],[currentBook valueForKey:@"author"],[currentBook valueForKey:@"pageCount"]);
    }
}
@end
