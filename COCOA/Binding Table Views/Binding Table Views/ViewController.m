//
//  ViewController.m
//  Binding Table Views
//
//  Created by admin on 5/9/23.
//

#import "ViewController.h"
#import "Book.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.allBooks =[[NSMutableArray alloc]init];
    
    Book *secondBook=[[Book alloc]init];
    secondBook.author=@"Arun Tiwari";
    secondBook.title=@"Wings Of Fire";
    secondBook.pageCount=228;
    [self.allBooks insertObject:secondBook atIndex:[self.allBooks count]];
    
   
   
    Book *thirdBook=[[Book alloc]init];
    [thirdBook setValue:@"Mahatma Gandhi" forKey:@"author"];
    [thirdBook setValue:@"My Experiments With Truth" forKey:@"title"];
    [thirdBook setValue:[NSNumber numberWithInt:499] forKey:@"pageCount"];
    [self.allBooks insertObject:thirdBook atIndex:[self.allBooks count]];
   NSLog(@"Done INIT");
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(id) init{
    self=[super init];
     self.allBooks =[[NSMutableArray alloc]init];
     
     Book *secondBook=[[Book alloc]init];
     secondBook.author=@"Arun Tiwari";
     secondBook.title=@"Wings Of Fire";
     secondBook.pageCount=228;
     [self.allBooks insertObject:secondBook atIndex:[self.allBooks count]];
     
    
    
     Book *thirdBook=[[Book alloc]init];
     [thirdBook setValue:@"Mahatma Gandhi" forKey:@"author"];
     [thirdBook setValue:@"My Experiments With Truth" forKey:@"title"];
     [thirdBook setValue:[NSNumber numberWithInt:499] forKey:@"pageCount"];
     [self.allBooks insertObject:thirdBook atIndex:[self.allBooks count]];
    NSLog(@"Done INIT");
    
    return self;
}


- (IBAction)listBooks:(id)sender {
    for(Book *currentBook in self.allBooks){
        NSLog(@"The Books %@ by %@ has %@ pages",[currentBook valueForKey:@"title"],[currentBook valueForKey:@"author"],[currentBook valueForKey:@"pageCount"]);
    }
}
@end
