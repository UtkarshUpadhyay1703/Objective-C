//
//  ViewController.m
//  File+Read+TableView
//
//  Created by admin on 5/29/23.
//

#import "ViewController.h"
#import "Employee.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)add:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
           NSString *documentsDirectory = [paths firstObject];
           NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Employee.plist"];
    
//    NSString *filePath=@"/Users/admin/Desktop/Employee.plist";
        
    
    Employee *emp = [[Employee alloc] initWithAll:[self.name stringValue] age1:[self.age stringValue] comp:[self.companyName stringValue]];
    
    NSDictionary *allEmployees =[[NSDictionary alloc] initWithObjectsAndKeys:emp,emp.tempName, nil];
    
    for(NSDictionary *p in allEmployees){
        NSLog(@"Counnnnnnt = %lu",(unsigned long)[allEmployees count]);
        NSLog(@" key = %@ ",p);
    }
    //,[[allEmployees valueForKey:p]tempName],[[allEmployees valueForKey:p]tempAge],[[allEmployees valueForKey:p]tempCompanyName]
    NSError *error =nil;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:allEmployees requiringSecureCoding:YES error:&error];
    if(data==nil) NSLog(@"error in serializing");
    else{
        if(![data writeToFile:filePath atomically:YES]) NSLog(@"Error in writing the data inside the file");
        else NSLog(@"Saved into file sucessfully");
    }

    //Read

}

-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
           NSString *documentsDirectory = [paths firstObject];
           NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Employee.plist"];
    
    
    NSData *read = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    self.nDictionary = [NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:[NSString class] objectsOfClass:[Employee class] fromData:read error:&error];
    if(self.nDictionary == nil) NSLog(@"Error deserilizing the data: %@",error.localizedDescription);
                    else{
//                        for(NSDictionary *p in self.nDictionary){
//                            NSLog(@" key = %@ Name = %@ age = %@ Company name = %@",p,[[self.nDictionary valueForKey:p]tempName],[[self.nDictionary valueForKey:p]tempAge],[[self.nDictionary valueForKey:p]tempCompanyName]);
//                        }
                    }
    NSLog(@"%lu",(unsigned long)[self.nDictionary count]);
    return [self.nDictionary count];
}

-(NSView *) tableView:(NSTableView *) tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSLog(@"-----------------");
    for(NSDictionary *p in self.nDictionary){
        NSLog(@" key = %@ Name = %@ age = %@ Company name = %@",p,[[self.nDictionary valueForKey:p]tempName],[[self.nDictionary valueForKey:p]tempAge],[[self.nDictionary valueForKey:p]tempCompanyName]);
    }
    
    
    NSMutableArray *arr=[[NSMutableArray alloc]init];
//    int index = 0;
//    for(NSDictionary *p in self.nDictionary){
//        [arr insertObject: p atIndex:index];
//        index++;
//    }
    
    NSArray *allKeys = [_nDictionary allKeys];
    
    for(int index=0; index<[self.nDictionary count];index++){
        [arr insertObject:[_nDictionary valueForKey:[allKeys objectAtIndex:index]]  atIndex:index];
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
