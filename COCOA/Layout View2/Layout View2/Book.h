//
//  Book.h
//  Layout View2
//
//  Created by admin on 5/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject
@property (strong) NSString *author;
@property (strong) NSString *title;
//@property (strong) NSDate *publishedDate;
@property int pageCount;
@end

NS_ASSUME_NONNULL_END
