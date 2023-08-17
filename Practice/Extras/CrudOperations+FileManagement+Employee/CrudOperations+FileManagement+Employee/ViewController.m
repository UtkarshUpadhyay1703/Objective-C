//
//  ViewController.m
//  CrudOperations+FileManagement+Employee
//
//  Created by admin on 5/31/23.
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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    self.filePath = [documentDirectory stringByAppendingPathComponent:@"Crud.plist"];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:self.filePath];
    if(dictionary == nil){
        dictionary = [NSMutableDictionary dictionary];
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *age = [formatter numberFromString:[_enterAge stringValue]];
    [dictionary setValue:age forKey:[_enterName stringValue]];
    if([dictionary writeToFile:_filePath atomically:YES]) NSLog(@"Written properly");
    else NSLog(@"failed to write inside file");
}
@end
