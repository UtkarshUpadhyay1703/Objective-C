//
//  ViewController.m
//  FullCalculator
//
//  Created by admin on 5/25/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.inputString=[NSMutableString string];
    self.isTypingNumber=NO;
    self.operation=@"";
    [self.displayLabel setStringValue:@"0"];
    //    self.fullString=[NSMutableString string];// this is used for setting the value of the display;
    //    self.fullStringNew=@"";
    //    [NSWindow changeColor:[NSColor whiteColor]];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}


- (IBAction)doNil:(id)sender {
    self.inputString=[NSMutableString string];
    self.isTypingNumber=NO;
    self.operation=@"";
    self.result=0.0;
    [self.displayLabel setStringValue:@""];
}

- (IBAction)operationButtonTapped:(id)sender {
    BOOL flag=NO;
    if(self.isTypingNumber){
        double inputValue = [self.inputString doubleValue];
        if([self.operation isEqualToString:@"+"]){
            self.result +=inputValue;
        }else if ([self.operation isEqualToString:@"-"]){
            self.result -=inputValue;
        }else if ([self.operation isEqualToString:@"X"]) {
            self.result *= inputValue;
        } else if ([self.operation isEqualToString:@"/"]) {
            if (inputValue != 0) {
                self.result /= inputValue;
            } else {
                // Handle division by zero error
                //                self.result = 0;
                //OR we can set an allert
                NSAlert *myAlert = [[NSAlert alloc]init];
                [myAlert addButtonWithTitle:@"OK"];
                [myAlert addButtonWithTitle:@"CANCEL"];
                [myAlert setMessageText:@"You / by 0"];
                [myAlert setMessageText:@"Either mistakely or conciously you have divided by 0"];
                [myAlert setAlertStyle:NSAlertStyleWarning];
                
                NSWindow *window=[[NSApplication sharedApplication] mainWindow];
                [myAlert beginSheetModalForWindow:window completionHandler:^(NSModalResponse result){
                    if(result == NSAlertFirstButtonReturn) NSLog(@"OK");
                    else if(result ==NSAlertSecondButtonReturn) NSLog(@"Cancel");
                    else NSLog(@"Invalid button typed");
                }];
                [window setBackgroundColor:[NSColor highlightColor]];
            }
        }else if([self.operation isEqualToString:@"%"]){
            self.result=(self.result/100)*inputValue;
        }else if ([self.operation isEqualToString:@"="]){
            [self operationButtonTapped:nil];
//            flag=YES;
        }else {
            self.result=inputValue;
        }
    }
    if(sender !=nil){
        self.operation = [sender title];
        if([self.operation isEqualToString:@"="]) flag=YES;
    }
    self.inputString=[NSMutableString string];
    self.isTypingNumber=NO;
    //    [self.displayLabel setStringValue:[NSString stringWithFormat:@"%.2f",self.result]];
    
    //OR for not incuding the result value 0 fraction values we can use number formatter.
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:3];
    NSString *formattedResult;
    if(flag){
        formattedResult = [formattedResult stringByAppendingString:@"="];
        formattedResult = [formatter stringFromNumber:[NSNumber numberWithDouble:self.result]];
        NSLog(@"formatted %@",formattedResult);
    }else{
        formattedResult = [formatter stringFromNumber:[NSNumber numberWithDouble:self.result]];
        formattedResult = [formattedResult stringByAppendingString:self.operation];
    }
    //    [self.fullString appendString:formattedResult];
    //    self.fullStringNew=[self.fullStringNew stringByAppendingString:formattedResult];
    //    NSLog(@"full String New = %@",self.fullStringNew);
    [self.displayLabel setStringValue:formattedResult];
}

- (IBAction)numberButtonTapped:(id)sender {
    //    NSString *number=sender.titleLabel.text;
    NSString *number = [sender title];
    NSLog(@"Number = %@ and %@",number,self.inputString);
    [self.inputString appendString:number];
    //    [self.fullString appendString:number];//for display purpose only
    //    self.fullStringNew=[self.fullStringNew stringByAppendingString:number];
    
    //    self.DisplayLabel.text=self.inputString;
    [self.displayLabel setStringValue:self.inputString];
    self.isTypingNumber=YES;
}
- (IBAction)lightTheme:(id)sender {
    NSWindow *window=[[NSApplication sharedApplication]mainWindow];
    [window setBackgroundColor:[NSColor lightGrayColor]];
}

- (IBAction)darkTheme:(id)sender {
    NSWindow *window=[[NSApplication sharedApplication]mainWindow];
    [window setBackgroundColor:[NSColor blackColor]];
}
@end
