//
//  newClass.h
//  View Data Source To Table
//
//  Created by admin on 5/10/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface newClass : NSObject<NSTableViewDataSource, NSTableViewDelegate>
@property (nonatomic, strong) NSArray *numbers;
@property (nonatomic, strong) NSArray *letters;

@end

NS_ASSUME_NONNULL_END
