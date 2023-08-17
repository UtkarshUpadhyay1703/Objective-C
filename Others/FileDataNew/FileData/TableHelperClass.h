//
//  TableHelperClass.h
//  FileData
//
//  Created by admin on 26/05/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableHelperClass : NSObject <NSTableViewDataSource, NSTableViewDelegate>

@property NSMutableDictionary * allBooks;
@property NSTableView * tableView;
- (IBAction)reload:(id)sender;
@property (strong) IBOutlet NSTextField *keyTextField;

@property (strong) IBOutlet NSTextField *titleTextField;
//@property (strong) IBOutlet NSTextField *authorTextField;
//@property (nonatomic, strong) NSString *filePath;

@property (strong) IBOutlet NSTextField *keyTextField1;

@end

NS_ASSUME_NONNULL_END
