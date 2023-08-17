//
//  NSObject+numberPalindromeOrNot.m
//  SampleCLI
//
//  Created by admin on 5/11/23.
//

#import "NSObject+numberPalindromeOrNot.h"

@implementation NSObject (numberPalindromeOrNot)
+(NSString *) palindromeOeNot:(int)num{
    int number=num;
    int result=0;
    while (number>0) {
        result=result*10+number%10;
        number=number/10;
    }
    if(num==result)return @"Yes this number is Palindrome";
    return @"Not a Palindrome number";
}
@end
