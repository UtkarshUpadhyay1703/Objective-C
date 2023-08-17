//
//  main.m
//  dataStructuresPractice
//
//  Created by admin on 5/15/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray *arr=@[@1,@2,@3,@"lol"];
        NSLog(@" %@",arr[3]);
        NSArray<NSString *> *gArr=@[@"lll",@1];
        NSLog(@"%@",gArr[1]);
    }
    return 0;
}
