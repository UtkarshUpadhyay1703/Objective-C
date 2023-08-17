//
//  Person.h
//  File Operations
//
//  Created by admin on 5/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSSecureCoding>
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *age;
- (instancetype) initWithNameAndAge:(NSString *)name arg2:(NSNumber *) age;
@end

NS_ASSUME_NONNULL_END
