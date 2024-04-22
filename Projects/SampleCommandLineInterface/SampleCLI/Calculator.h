//
//  Calculator.h
//  SampleCLI
//
//  Created by admin on 5/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject
+(int) add:(NSString *)num1 add2:(NSString *)num2;
+(int) diff:(NSString *)num1 diff2:(NSString *)num2;
+(int) mul:(int)num1 mul2:(int)num2;
+(int) div:(int)num1 div2:(int)num2;
+(int) mod:(int)num;
@end

NS_ASSUME_NONNULL_END
