//
//  TableViewHelperClass.h
//  Dictionary+TableView+FileManagement
//
//  Created by admin on 5/30/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewHelperClass : NSObject<NSTableViewDataSource,NSTableViewDelegate>
@property (strong) NSString *filePath;
@property (strong) NSMutableDictionary *allEmployees;
//Outlet
//@property (weak) IBOutlet NSTableCellView *showName;
//@property (weak) IBOutlet NSTableCellView *showAge;



@end

NS_ASSUME_NONNULL_END
