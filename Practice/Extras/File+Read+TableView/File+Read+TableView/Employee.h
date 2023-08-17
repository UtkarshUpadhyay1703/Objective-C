//
//  Employee.h
//  File+Read+TableView
//
//  Created by admin on 5/29/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject <NSSecureCoding>
@property NSString *tempName;
@property NSNumber *tempAge;
@property NSString *tempCompanyName;
-(id) initWithAll : (NSString *) name age1:(NSNumber *)age comp:(NSString *)companyName;
@end

NS_ASSUME_NONNULL_END
