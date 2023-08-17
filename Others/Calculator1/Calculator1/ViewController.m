//
//  ViewController.m
//  Calculator1
//
//  Created by Admin on 5/23/23.
//

#import "ViewController.h"

@implementation ViewController
@synthesize num1,num2,answer,theNumber,operand,lblText,textout;




- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self setNum1:0];
    [self setNum2:0];
    [self setOperand:PLUS];
    [self setAnswer:0.0];
    [self setTheNumber:@"0"];

[self printNo];
    

   
}
-(void)printNo
{
    [textout setStringValue:theNumber];
   
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)press9:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"9"];
    [self printNo];
}

- (IBAction)press8:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"8"];
    [self printNo];
}
- (IBAction)press7:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"7"];
    [self printNo];
}
- (IBAction)press6:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"6"];
    [self printNo];
}
- (IBAction)press5:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"5"];
    [self printNo];
}
- (IBAction)press4:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"4"];
    [self printNo];
}
- (IBAction)press3:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"3"];
    [self printNo];
}
- (IBAction)press2:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"2"];
    [self printNo];
}
- (IBAction)press1:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"1"];
    [self printNo];
}
- (IBAction)press0:(id)sender
{
    theNumber=[theNumber stringByAppendingString:@"0"];
    [self printNo];
}

-(void)saveNum1
{
    num1=[theNumber integerValue];
    theNumber=@"0";
    [self printNo];
}

- (IBAction)setPlus:(id)sender
{
    [self saveNum1];
    operand=PLUS;
}

- (IBAction)setMinus:(id)sender
{
    [self saveNum1];
    operand=MINUS;
}
- (IBAction)setMultiply:(id)sender
{
    [self saveNum1];
    operand=MULTIPLY;
}

- (IBAction)setDivide:(id)sender
{
    [self saveNum1];
    operand=DIVIDE;
}

- (IBAction)equalButton:(id)sender
{
    num2=[theNumber integerValue];
    
    if(operand== PLUS)
    {
        answer=num1+num2;
    }
    else if(operand== MINUS)
    {
        answer=num1-num2;
    }
    else if(operand== MULTIPLY)
    {
        answer=num1*num2;
    }
    else
    {    if(num2==0)
          {
              NSAlert *alert = [[NSAlert alloc] init];
                 [alert setMessageText:@"Error"];
                 [alert setInformativeText:@"Cannot Divide By Zero !"];
                 [alert addButtonWithTitle:@"OK"];
                 [alert runModal];
          }
        else
        {
            answer=(double)num1/(double)num2;
            
        }
    }
    
    theNumber=[NSString stringWithFormat:@"%f",answer];
    [self printNo];
    num1=0;
    num2=0;
    answer=0.0;
}
- (IBAction)clearButton:(id)sender {
    theNumber=@"0";
    [self printNo];
}


@end
