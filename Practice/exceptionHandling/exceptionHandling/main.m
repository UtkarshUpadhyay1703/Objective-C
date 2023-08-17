//
//  main.m
//  exceptionHandling
//
//  Created by admin on 5/18/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        @try {
            @throw [NSException exceptionWithName:@"Bhai Gadbad Ho Gai" reason:@"Socho Socho..." userInfo:nil];
        } @catch (NSException *exception) {
            NSLog(@"Exception name = %@, Exception = %@ ",exception.name,exception);
        } @finally {
            NSLog(@"All clean-up done");
        }
    }
    return 0;
}
