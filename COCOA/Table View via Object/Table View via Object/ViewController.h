//
//  ViewController.h
//  Table View via Object
//
//  Created by admin on 5/10/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTableViewDelegate,NSTableViewDataSource>
@property (strong) NSArray *allBooks;

@end

