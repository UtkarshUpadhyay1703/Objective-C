//
//  UpdateAndDelete.h
//  CrudOperations+FileManagement+Employee
//
//  Created by admin on 5/31/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface UpdateAndDelete : NSObject

@property (strong) NSMutableDictionary *allEmployees;

//These are for Update
@property (weak) IBOutlet NSTextField *updateName;
@property (weak) IBOutlet NSTextField *updateAge;
- (IBAction)update:(id)sender;


//These are for Delete
@property (weak) IBOutlet NSTextField *deleteName;

- (IBAction)delete:(id)sender;


@end

NS_ASSUME_NONNULL_END
