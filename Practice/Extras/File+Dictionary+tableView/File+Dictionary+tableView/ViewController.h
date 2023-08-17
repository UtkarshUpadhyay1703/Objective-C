//
//  ViewController.h
//  File+Dictionary+tableView
//
//  Created by admin on 5/29/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTabViewDelegate,NSTableViewDataSource>
@property NSDictionary *dictionary;
//
@property (weak) IBOutlet NSTextField *name;
@property (weak) IBOutlet NSTextField *age;
@property (weak) IBOutlet NSTextField *companyName;
@property (weak) IBOutlet NSTableColumn *showName;
@property (weak) IBOutlet NSTableColumn *showAge;
@property (weak) IBOutlet NSTableColumn *showCompanyName;

@property (strong) NSString *filePath;


- (IBAction)add:(id)sender;

@end

