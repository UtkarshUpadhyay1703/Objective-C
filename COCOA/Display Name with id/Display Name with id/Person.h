//
//  Person.h
//  Display Name with id
//
//  Created by admin on 5/10/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
<NSTableViewDelegate,NSTableViewDataSource>
@property (strong) NSArray *ids;
@property (strong) NSArray *names;

@end

NS_ASSUME_NONNULL_END
