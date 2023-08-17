//
//  Book.h
//  Single View
//
//  Created by admin on 5/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject
@property (strong) NSString *author;
@property (strong) NSString *title;
@property (strong) NSDate *date;
@property int pageCount;
@end

NS_ASSUME_NONNULL_END
