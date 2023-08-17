//
//  NSString+removeWideSpaces.m
//  Inheritance
//
//  Created by admin on 5/3/23.
//

#import "NSString+removeWideSpaces.h"
#import <Foundation/Foundation.h>
@implementation NSString (NSString_removeWideSpaces)
-(NSString *) convertSpaces{
    return [self stringByReplacingOccurrencesOfString:@"" withString:@"_"];
}
@end

int main(int argc,const char * argv[])
{
    @autoreleasepool {
        NSString * text=@"The quick brown fox jumped over the lazy dog";
        NSLog(@"The sentence is = %@",[text convertSpaces]);
        
    }
    return 0;
}
