//
//  Calculator.h
//  InterfaceUse
//
//  Created by admin on 5/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject{
    int number1;
    int number2;
    NSDate *date1;
}

@property int number1;
@property int number2;
@property NSDate *date1;

-(id) initWithNumber1:(int) num1;
-(id) initWithNumber2:(int) num2;
-(id) initBothNumbers:(int) num1 member2:(int)num2;
-(id) initDate;

-(void) check;
-(int) add: (int) num1 add1:(int) num2;
-(int) diff:(int) num1 sub1:(int) num2;

@end

NS_ASSUME_NONNULL_END
