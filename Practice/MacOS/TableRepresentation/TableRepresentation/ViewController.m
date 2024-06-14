//
//  ViewController.m
//  TableRepresentation
//
//  Created by admin on 6/10/24.
//

#import "ViewController.h"


@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSNumber *percentage;

- (instancetype)initWithName:(NSString *)name
				   className:(NSString *)class
				  percentage:(NSNumber *)percentage;

@end

@implementation Person

- (instancetype)initWithName:(NSString *)name
				   className:(NSString *)class
				  percentage:(NSNumber *)percentage {
	self = [super init];
	if (self) {
		self.name = name;
		self.className = class;
		self.percentage = percentage;
	}
	return self;
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.personList = [NSMutableArray arrayWithObjects:[[Person alloc] initWithName:@"A" className:@"1" percentage:@11], [[Person alloc] initWithName:@"B" className:@"11" percentage:@111], [[Person alloc] initWithName:@"C" className:@"111" percentage:@1111], nil];
	self.removeSelectedPersonOutlet.enabled = false;

	// Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

#pragma mark -
#pragma mark ***** Required Methods (unless bindings are used) *****

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView NS_SWIFT_UI_ACTOR {
	return  self.personList.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	Person* person = self.personList[row];
	NSTableCellView *cell = nil;
	NSString *columnIdentifier = tableColumn.identifier;
	cell = [tableView makeViewWithIdentifier:columnIdentifier owner:self];
	if (cell != nil)
	{
		if ([columnIdentifier isEqualToString:@"Name"])
		{
			cell.textField.stringValue = person.name;
		} else if ([columnIdentifier isEqualToString:@"Class"])
		{
			cell.textField.stringValue = person.className;
		} else if ([columnIdentifier isEqualToString:@"Percentage"])
		{
			cell.textField.stringValue = person.percentage.stringValue;
		} else
		{
			NSLog(@"Table get different Identifier = %@ !!", columnIdentifier);
		}
	} else
	{
		NSLog(@"Table is empty!!");
	}
	
	return  cell;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
	self.removeSelectedPersonOutlet.enabled = self.tableView.selectedRow != -1;
}

- (IBAction)removeSelectedPersonAction:(id)sender {
	[self.personList removeObjectAtIndex:self.tableView.selectedRow];
	[self.tableView reloadData];
}
@end
