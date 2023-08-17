//
//  ViewController.m
//  File+Dictionary+tableView
//
//  Created by admin on 5/29/23.
//

#import "ViewController.h"
#import "Employee.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.


    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths firstObject];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Employee1.plist"];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//           NSString *documentsDirectory = [paths firstObject];
//           NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Employee.plist"];
//    NSString *filePath=@"/Users/admin/Desktop/Employee.plist";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if(![manager fileExistsAtPath:filePath]){
        NSLog(@"Not present");
        NSDictionary *emptyDictionary = @{};
                [emptyDictionary writeToFile:filePath atomically:YES];
    }
    
    self.dictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    for(NSDictionary *p in self.dictionary){
        NSLog(@" key = %@ Name = %@ age = %@ Company name = %@",p,[[self.dictionary valueForKey:p]tempName],[[self.dictionary valueForKey:p]tempAge],[[self.dictionary valueForKey:p]tempCompanyName]);
                            }
    NSLog(@"count = %lu",(unsigned long)[self.dictionary count]);
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)add:(id)sender {
    Employee *emp = [[Employee alloc] initWithAll:[self.name stringValue] age1:[self.age stringValue] comp:[self.companyName stringValue]];
//    NSLog(@"name = %@ age = %@ compName = %@",[emp tempName],[emp tempAge],[emp tempCompanyName]);
    NSDictionary *allEmployees =[[NSDictionary alloc] initWithObjectsAndKeys:emp,emp.tempName, nil];
    for(NSDictionary *p in allEmployees){
        NSLog(@" key = %@ Name = %@ age = %@ Company name = %@",p,[[allEmployees valueForKey:p]tempName],[[allEmployees valueForKey:p]tempAge],[[allEmployees valueForKey:p]tempCompanyName]);
                            }
    NSLog(@"count = %lu",(unsigned long)[allEmployees count]);


    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths firstObject];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Employee1.plist"];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//           NSString *documentsDirectory = [paths firstObject];
//           NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Employee.plist"];
//    NSString *filePath=@"/Users/admin/Desktop/Employee.plist";



    if([allEmployees writeToFile:filePath atomically:YES]) NSLog(@"Written sucessfully");
    else NSLog(@"Not written !!!!!!!!!!!!!!!!!");
}


-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView{

    return [self.dictionary count];
}

-(NSView *) tableView:(NSTableView *) tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSLog(@"-----------------");
    NSMutableArray *arr=[NSMutableArray alloc];
    int index = 0;
    for(NSDictionary *p in self.dictionary){
        [arr insertObject: p atIndex:index];
        index++;
    }
    for(NSArray *a in arr){
        NSLog(@"name = %@",a);
    }

    NSString *identifier = tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
    if([identifier isEqualToString:@"name"]){
        cell.textField.stringValue = [[arr objectAtIndex:row] tempName];
    }else if([identifier isEqualToString:@"age"]) {
        cell.textField.intValue = [[[arr objectAtIndex:row] tempAge] intValue];
    }else {
        cell.textField.stringValue = [[arr objectAtIndex:row]tempCompanyName];
    }
    return cell;
}

@end


