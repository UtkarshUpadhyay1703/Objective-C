//
//  Calculator.m
//  SampleCLI
//
//  Created by admin on 5/11/23.
//

#import "Calculator.h"

@implementation Calculator
+(int) add:(NSString *)num1 add2:(NSString *)num2{
    int number1=[num1 intValue];
    int number2=[num2 intValue];
    return number1+number2;
}
+(int) diff:(NSString *)num1 diff2:(NSString *)num2{
    int number1=[num1 intValue];
    int number2=[num2 intValue];
    if(number1>number2)return number1-number2;
    return number2-number1;
}
+(int) mul:(int)num1 mul2:(int)num2{
    return num1*num2;
}
+(int) div:(int)num1 div2:(int)num2{
    return num1/num2;
}
+(int) mod:(int)num{
    return num%10;
}
@end
