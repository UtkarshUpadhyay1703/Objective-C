//
//  TableHelperClass.h
//  TableViewController
//
//  Created by admin on 10/05/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableHelperClass : NSObject <NSTableViewDelegate,NSTableViewDataSource>

@property (strong) NSArray * allBooks;


@end

NS_ASSUME_NONNULL_END
