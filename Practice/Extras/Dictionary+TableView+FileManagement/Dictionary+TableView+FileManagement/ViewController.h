//
//  ViewController.h
//  Dictionary+TableView+FileManagement
//
//  Created by admin on 5/30/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
//Some locally used property
@property (strong) NSString *filePath;
@property (weak) IBOutlet NSTextField *enterName;
@property (weak) IBOutlet NSTextField *enterAge;


//some Action
- (IBAction)addEmployee:(id)sender;

@end

