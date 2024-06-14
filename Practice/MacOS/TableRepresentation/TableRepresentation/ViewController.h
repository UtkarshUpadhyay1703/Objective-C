//
//  ViewController.h
//  TableRepresentation
//
//  Created by admin on 6/10/24.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *tableView;
@property (strong) NSMutableArray *personList;
@property (weak) IBOutlet NSButton *removeSelectedPersonOutlet;

- (IBAction)removeSelectedPersonAction:(id)sender;



@end

