//
//  ViewController.h
//  File+Read+TableView
//
//  Created by admin on 5/29/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTabViewDelegate,NSTableViewDataSource>
@property (strong,nonatomic) NSDictionary *nDictionary;

//Adding Outlet 
@property (weak) IBOutlet NSTextField *name;
@property (weak) IBOutlet NSTextField *age;
@property (weak) IBOutlet NSTextField *companyName;

//Adding the action of button
- (IBAction)add:(id)sender;


@property (weak) IBOutlet NSTableColumn *showName;
@property (weak) IBOutlet NSTableColumn *showAge;
@property (weak) IBOutlet NSTableColumn *showCompanyName;


@end

