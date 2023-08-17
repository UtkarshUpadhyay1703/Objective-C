//
//  PrimeNumberCheck.h
//  InterfaceUse
//
//  Created by admin on 5/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PrimeNumberCheck : NSObject
{
    
}
-(BOOL) checkNumber:(int) num;
+(int) checkStaticMethod:(int) num;
@end

NS_ASSUME_NONNULL_END
