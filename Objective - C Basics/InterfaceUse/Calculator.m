//
//  Calculator.m
//  InterfaceUse
//
//  Created by admin on 5/2/23.
//

#import "Calculator.h"
#import "PrimeNumberCheck.h"

@implementation Calculator
{
    
}
@synthesize number1;
@synthesize number2;
@synthesize date1;

-(id) initWithNumber1:(int)num1{
    self=[super init];
    if(self){
        number1=num1;
    }
    return self;
}
-(id) initWithNumber2:(int) num2{
    self=[super init];
    if(self){
        number2=num2;
    }
    return self;
}

-(id) initBothNumbers:(int)num1 member2:(int)num2{
    self=[super init];
    if(self){
        number1=num1;
        number2=num2;
    }
    return self;
}
-(id) initDate{
    self=[super init];
    if(self){
        date1=[[NSDate alloc] init];
    }
    return self;
}

-(void)check{
    NSLog(@"Checked");
}
-(int)add:(int)num1 add1:(int)num2{
    return num1+num2;
}
-(int)diff:(int)num1 sub1:(int)num2{
    if(num1>num2)return num1-num2;
    return num2-num1;
}
//-(void) dealloc{
//    [date1 release];
//    [super dealloc];
//}
@end

#import <Foundation/Foundation.h>
//int main(int argc, const char * argv[]){
////Calculator * calc=[[Calculator alloc] init];
////    [calc check];
////    NSLog(@"%i",[calc add:2 add1:5]);
////    int *arr[]={1,2,3,4,5};
////    NSLog(@"%i",arr[0]);
////    NSArray *ant=[NSArray arrayWithObjects:@"Pune",@"Mathura",@"Agra",11];
////    int i=0;
////    for (i=0; i<4; i++) {
////        NSLog(@"Where are you from %@",[ant objectAtIndex:i]);
////    }
//    
////    NSMutableArray *muArr=[NSMutableArray arrayWithObjects:@"one",@"two", nil];
////    [muArr addObject:@"fifty"];
////    [muArr removeObject:0];
////    for (i=0; i<3; i++) {
////            NSLog(@"Where are you from %@",[muArr objectAtIndex:i]);
////        }
//    
//    
//    
////    NSDictionary *places=[NSDictionary dictionaryWithObjectsAndKeys:@"Mumbai",@"Maha",@"Lucknow",@"U.P.", nil];
////    for(NSString *cap in places){
////        NSLog(@"%@ capital of %@",[places valueForKey:cap],cap);
////    }
//    
////    PrimeNumberCheck *pmc=[[PrimeNumberCheck alloc]init];
////    NSLog(@"12 is prime number or not %hhd",[pmc checkNumber:12]);
//    
//    
////    Calculator *calculate=[[Calculator alloc]init];
////    [calculate setNumber1:234];
////    [calculate setNumber2:432];
////    NSLog(@"%i",[calculate number2]);
////    NSLog(@"%i",[calculate number1]);
//    
////    NSLog(@"Difference = %i",[calculate diff:63 sub1:28]);
//    
//    Calculator * maths=[[Calculator alloc] initWithNumber1:22];
//    Calculator * maths1=[[Calculator alloc] initWithNumber2:55];
//    Calculator * fullMaths=[[Calculator alloc] initBothNumbers:555 member2:777];
//    NSLog(@" first number = %i and second number = %i and For both numbers is %i and %i",[maths number1],[maths1 number2],[fullMaths number1],[fullMaths number2]);
//    
//    
//    NSMutableDictionary * dictionary=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Indian Air Force",@"Air",
//                                      @"Indian Army",@"Land",
//                                      @"Indian Navy", @"Ocean",
////                                      [maths number1],22,[maths1 number2],55,[fullMaths number2],@"both",
//                                      nil];
//    
//    for(NSString *dic1 in dictionary){
//        NSLog(@"here is the %@ and %@",dic1,[dictionary valueForKey:dic1]);
//    }
//    
//    
//    
//    
//    
//    
//}
