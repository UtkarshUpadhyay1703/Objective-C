//
//  main.m
//  SampleCLI
//
//  Created by admin on 5/11/23.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "NSObject+numberPalindromeOrNot.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int i;
       
                for (i = 0; i < argc; i++)
                {
                    NSString *str = [NSString stringWithUTF8String:argv[i]];
                    NSLog(@"argv[%d] = '%@'", i, str);
                    
                }
        // For Addition taking input as string
        NSLog(@"Addition = %i",[Calculator add:[NSString stringWithUTF8String:argv[1]] add2:[NSString stringWithUTF8String:argv[2]]]);
        //For Difference taking input as string
        NSLog(@"Difference = %i",[Calculator diff:[NSString stringWithUTF8String:argv[1]] diff2:[NSString stringWithUTF8String:argv[2]]]);
        //For multiplication and used atoi for conversion from string to integer
        NSLog(@"Multiplication = %i",[Calculator mul:atoi(argv[1]) mul2:atoi(argv[2])]);
        //For Division and used atoi for conversion from string to integer
        NSLog(@"Division = %i",[Calculator div:atoi(argv[1]) div2:atoi(argv[2])]);
        //For Modulus and used atoi for conversion from string to integer
        NSLog(@"Mod = %i",[Calculator mod:atoi(argv[1])]);
        NSLog(@"%@",[Calculator palindromeOeNot:atoi(argv[1])]);
        
//        NSLog(@"\n Addition = %i \n Subtraction = %i \n Multiplication = %i \n Division = %i \n Modulus = %i",[Calculator add:@"10" add2:@"20"],[Calculator sub:@"20" sub2:@"30"],[Calculator mul:10 mul2:20],[Calculator div:10 div2:5],[Calculator mod:55]);
        
        
        
        //        NSLog(@"%i",[@"10" intValue]);
    }
    return 0;
}
