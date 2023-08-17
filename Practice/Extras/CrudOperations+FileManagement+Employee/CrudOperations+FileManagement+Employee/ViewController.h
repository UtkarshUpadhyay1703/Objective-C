//
//  ViewController.h
//  CrudOperations+FileManagement+Employee
//
//  Created by admin on 5/31/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
// file path
@property (strong) NSString *filePath;

//Entred Details property
@property (weak) IBOutlet NSTextField *enterName;
@property (weak) IBOutlet NSTextField *enterAge;
//Action to add new employee
- (IBAction)addEmployee:(id)sender;

@end

