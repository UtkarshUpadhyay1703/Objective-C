//
//  ViewController.h
//  Calculator1
//
//  Created by Admin on 5/23/23.
//

#import <Cocoa/Cocoa.h>
#define PLUS 0
#define MINUS 1
#define MULTIPLY 2
#define DIVIDE 3
@interface ViewController : NSViewController

@property NSInteger num1;
@property NSInteger num2;
@property double answer;
@property (strong)NSString *theNumber;
@property NSInteger operand;
@property IBOutlet NSPanel *lblText ;


@property (strong) IBOutlet NSTextField *textout;


@end

