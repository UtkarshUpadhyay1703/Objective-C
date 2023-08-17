//
//  ViewController.h
//  BindingTableViewsTry
//
//  Created by admin on 5/9/23.
//

#import <Cocoa/Cocoa.h>
#import "Book.h"
@interface ViewController : NSViewController
@property (strong) NSMutableArray *allBooks;
- (IBAction)showAllBooks:(id)sender;

@end

