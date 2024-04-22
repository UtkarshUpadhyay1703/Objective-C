//
//  main.m
//  Dynamic Typing
//
//  Created by admin on 5/3/23.
//

#import <Foundation/Foundation.h>
#import "First.h"
#import "Second.h"
#import "Third.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSMutableArray *arr=[[NSMutableArray alloc]init];
        for(int i=0;i<100;i++){
            int whichObject = (arc4random()%3)+1;
            id temp;
            switch (whichObject) {
                case 1:
                    temp=[[First alloc]init];
                    break;
                case 2:
                    temp=[[Second alloc] init];
                    break;
                default:
                    temp=[[Third alloc]init];
                    break;
            }
            [arr addObject:temp];
        }
        for(id class1 in arr){
            NSLog(@"the object is = %@ ",class1);
            if([class1 isKindOfClass:[Second class]]) [class1 print];
            if([class1 respondsToSelector:@selector(print)]) [class1 print];
        }
        
        //        NSString *text;
        //        [text uppercaseString];
        //        NSLog(@"%@",text);
        
        
        //        @try {
        //            id runTimeError=[[NSDate alloc]init];
        //            [runTimeError uppercaseString];
        //        } @catch (NSException *exception) {
        //            NSLog(@"%@",exception);
        //        } @finally {
        //            NSLog(@"Just kidding");
        //        }
        
    }
    return 0;
}
