//
//  Book.h
//  DictionaryToFileManagment
//
//  Created by admin on 15/05/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject <NSSecureCoding>

@property (strong) NSString *title;
@property (strong) NSString *author;

-(instancetype)initWithTitle:(NSString *)_title author:(NSString *)_author;

@end

NS_ASSUME_NONNULL_END
