//
//  Book.h
//  Book in Table
//
//  Created by admin on 5/10/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject<NSTableViewDataSource, NSTableViewDelegate>
@property (nonatomic,strong) NSArray *author;
@property (nonatomic,strong) NSArray *title;
@property (nonatomic,strong) NSArray *date;
@property (nonatomic,strong) NSArray *pageCount;
@end

NS_ASSUME_NONNULL_END
