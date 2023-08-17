//
//  ViewController.m
//  TryUI
//
//  Created by admin on 5/24/23.
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
    [self.displayLabel setStringValue:@"0"];
}

- (IBAction)operationButtonTapped:(id)sender {
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
                [myAlert setMessageText:@"Either mistake or conciously you have divided by 0"];
                [myAlert setAlertStyle:NSAlertStyleWarning];
                
                NSWindow *window=[[NSApplication sharedApplication] mainWindow];
                [myAlert beginSheetModalForWindow:window completionHandler:^(NSModalResponse result){
                 if(result == NSAlertFirstButtonReturn) NSLog(@"OK");
                    else if(result ==NSAlertSecondButtonReturn) NSLog(@"Cancel");
                    else NSLog(@"Invalid button typed");
                }];
                [window setBackgroundColor:[NSColor highlightColor]];
            }
        }else if ([self.operation isEqualToString:@"="]){
            [self operationButtonTapped:nil];
        }else {
            self.result=inputValue;
        }
    }
    if(sender !=nil){
        self.operation = [sender title];
    }
    self.inputString=[NSMutableString string];
    self.isTypingNumber=NO;
//    [self.displayLabel setStringValue:[NSString stringWithFormat:@"%.2f",self.result]];
    //OR for not incuding the result value 0 fraction values we can use number formatter.
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:3];
    NSString *formattedResult = [formatter stringFromNumber:[NSNumber numberWithDouble:self.result]];
    [self.displayLabel setStringValue:formattedResult];
}

- (IBAction)numberButtonTapped:(id)sender {
    //    NSString *number=sender.titleLabel.text;
        NSString *number = [sender title];
        NSLog(@"Number = %@",number);
        [self.inputString appendString:number];
    //    self.DisplayLabel.text=self.inputString;
        [self.displayLabel setStringValue:self.inputString];
        self.isTypingNumber=YES;
}
@end
