//
//  Student.h
//  Sorting
//
//  Created by admin on 5/16/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
@property NSString *name;
@property NSNumber *standard;

-(NSString *) favSubject:(NSString *)sub;

@end

NS_ASSUME_NONNULL_END
