//
//  UpdateAndDelete.m
//  CrudOperations+FileManagement+Employee
//
//  Created by admin on 5/31/23.
//

#import "UpdateAndDelete.h"

@implementation UpdateAndDelete

- (IBAction)delete:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:@"Crud.plist"];
    
   _allEmployees = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    if (_allEmployees == nil) {
        _allEmployees = [NSMutableDictionary dictionary];
    }
    if([[_deleteName stringValue] length]>0){
        if([_allEmployees valueForKey:[_deleteName stringValue]]){
            [_allEmployees removeObjectForKey:_deleteName];
            NSLog(@"Deleted Successfully");
        }
        else NSLog(@"Enter valid name");
    }
    else NSLog(@"Enter any name");
    [_allEmployees writeToFile:filePath atomically:YES];
}


- (IBAction)update:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:@"Crud.plist"];
    
    _allEmployees = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    if (_allEmployees == nil) {
        _allEmployees = [NSMutableDictionary dictionary];
    }
    
    if([[_updateName stringValue] length]>0 && [[_updateAge stringValue] length]>0 ){
        if([_allEmployees valueForKey:[_updateName stringValue]]){
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            NSNumber *age = [formatter numberFromString:[_updateAge stringValue]];
            [_allEmployees setValue:age forKey:[_updateName stringValue]];
            NSLog(@"Updated Successfully");
        }
        else NSLog(@"Enter valid name");
    }
    else NSLog(@"Enter any name");
    [_allEmployees writeToFile:filePath atomically:YES];
}
@end
