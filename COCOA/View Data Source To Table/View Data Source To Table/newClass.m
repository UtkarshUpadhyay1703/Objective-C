//
//  newClass.m
//  View Data Source To Table
//
//  Created by admin on 5/10/23.
//

#import "newClass.h"

@implementation newClass
//- (void)awakeFromNib
- (NSArray *)numbers {
    if (!_numbers) {
        _numbers = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    }
    return _numbers;
}
- (NSArray *)letters {
    if (!_letters) {
        _letters = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j"];
    }
    return _letters;
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.numbers.count;
}
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
    if ([identifier isEqualToString:@"numbers"]) {
        cell.textField.stringValue = [self.numbers objectAtIndex:row];
    } else {
        cell.textField.stringValue = [self.letters objectAtIndex:row];
    }
    return cell;
}

@end
