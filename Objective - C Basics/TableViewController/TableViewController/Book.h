//
//  Book.h
//  TableViewController
//
//  Created by admin on 10/05/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (strong) NSString *title;
@property (strong) NSString *author;
@property int pageCount;

-(instancetype)initWithTitle:(NSString *)_title author:(NSString *) _author pageCount:(int)_pageCount;

@end

NS_ASSUME_NONNULL_END
