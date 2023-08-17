//
//  ViewController.m
//  Dictionary+TableView+FileManagement
//
//  Created by admin on 5/30/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)addEmployee:(id)sender {
    NSString *name = [_enterName stringValue];
    //number formatter for string to int
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *age = [formatter numberFromString:[_enterAge stringValue]];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    self.filePath = [documentsDirectory stringByAppendingPathComponent:@"EmployeeNameAge.plist"];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:self.filePath];
    if (dic == nil) {
        dic = [NSMutableDictionary dictionary];
    }
    [dic setValue:age forKey:name];
    if([dic writeToFile:self.filePath atomically:YES]) NSLog(@"Written properly");
    else NSLog(@"failed to write inside file");
}
@end
