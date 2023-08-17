

#import "TableHelperClass.h"

@implementation TableHelperClass

-(void)awakeFromNib{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"BookDictionary.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:filePath]) {
        // If the file doesn't exist, create a new dictionary and save it to the file
        self.allBooks = [NSMutableDictionary dictionary];
        [self.allBooks writeToFile:filePath atomically:YES];
    } else {
        // If the file exists, load the existing dictionary from the file
        self.allBooks = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    }
    
    
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSArray *keys = [self.allBooks allKeys];
    NSLog(@"no. of books  %li", [keys count]);
    return [keys count];
}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier = tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:identifier owner:self];
    
    NSArray *keys = [self.allBooks allKeys];
    if (row >= 0 && row < [keys count]) {
        NSString *key = keys[row];
        if ([identifier isEqualToString:@"title"]) {
            NSString *title = self.allBooks[key];
            cell.textField.stringValue = title;
        }
        else if ([identifier isEqualToString:@"author"]) {
            NSString *author = key;
            cell.textField.stringValue = author;
        }
        else {
            NSLog(@"Not Working");
        }
    }
    [self reloadDictionary];
    [self.tableView reloadData];
    return cell;
}



-(void)reloadDictionary{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"BookDictionary.plist"];
    
    self.allBooks = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    [self.tableView reloadData];
}

- (IBAction)reload:(id)sender {
    
    NSLog(@"no. of books %li",[self.allBooks count]);
    
    
}
- (IBAction)deleteRecord:(id)sender
{
    
    NSString *key = self.keyTextField.stringValue;
    if (key.length > 0) {
        [self deleteRecordWithKey:key];
        self.keyTextField.stringValue = @"";
    }
    [self reloadDictionary];
    
    [self.tableView reloadData];
}


-(void)deleteRecordWithKey:(NSString *)key {
    if (key && [self.allBooks objectForKey:key]) {
        [self.allBooks removeObjectForKey:key];
        [self saveDictionaryToFile];
        [self reloadDictionary];
        [self.tableView reloadData];
    }
}
//
-(void)saveDictionaryToFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"BookDictionary.plist"];
    
    [self.allBooks writeToFile:filePath atomically:YES];
    [self reloadDictionary];
    [self.tableView reloadData];
}

- (IBAction)updateRecord:(id)sender
{
    NSString *key1 = self.keyTextField1.stringValue;
    NSString *newTitle = self.titleTextField.stringValue;
    // NSString *newAuthor = self.authorTextField.stringValue;
    
    [self updateRecordWithTitle:newTitle  forKey:key1];
    
    // Clear the text fields after updating the record
    self.keyTextField1.stringValue = @"";
    self.titleTextField.stringValue = @"";
    // self.authorTextField.stringValue = @"";
    
}

- (void)updateRecordWithTitle:(NSString *)title  forKey:(NSString *)key {
    if (key && [self.allBooks objectForKey:key]) {
        // Check if the author exists as a key in the dictionary
        NSString *existingAuthor = [self.allBooks objectForKey:key];
        if (existingAuthor) {
            // Update the title for the author's key
            [self.allBooks setObject:title forKey:existingAuthor];
            
            // Save the updated dictionary to the file
            [self saveDictionaryToFile];
            
            // Reload the dictionary and reload the table view
            [self reloadDictionary];
            [self.tableView reloadData];
        } else {
            NSLog(@"Author does not exist as a key");
        }
    }
}

@end
