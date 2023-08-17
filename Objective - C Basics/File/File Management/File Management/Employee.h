//
//  Employee.h
//  File Management
//
//  Created by admin on 5/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject
{
    NSString *name;
    int grade;
    NSString *companyName;
}
@property (retain) NSString *name;
@property int grade;
@property (retain) NSString *companyName;
@end

NS_ASSUME_NONNULL_END
