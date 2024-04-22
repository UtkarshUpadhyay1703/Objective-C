//
//  PrimeNumberCheck.m
//  InterfaceUse
//
//  Created by admin on 5/2/23.
//

#import "PrimeNumberCheck.h"

@implementation PrimeNumberCheck
{
    
}
-(BOOL) checkNumber:(int) num{
    if (num==1 || num==2) return YES;
    bool flag=YES;
    for (int i=2; i<num/2; i++) {
        if(num%i==0){
            flag=NO;
            break;
        }
    }
    if(flag) return YES;
    return NO;
}

+(int) checkStaticMethod:(int) num{
    if(num>=0) return num;
    else return (num*-1);
}
@end
#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]){
    @autoreleasepool {
        NSLog(@"hii");
        NSLog(@"only positive number = %i",[PrimeNumberCheck checkStaticMethod:-10]);
    }
    return 0;
}
