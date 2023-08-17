//
//  ViewController.m
//  FileData
//
//  Created by admin on 26/05/23.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)addBookToFile:(id)sender {

    NSString *title = [_titleText stringValue];
       NSLog(@"%@", title);
       NSString *author = [_authorText stringValue];
       NSLog(@"%@", author);
    
       NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
       NSString *documentsDirectory = [paths firstObject];
       NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"BookDictionary.plist"];

    NSMutableDictionary *existingBooks = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    if (existingBooks == nil) {
        existingBooks = [NSMutableDictionary dictionary];
    }
    [existingBooks setObject:title forKey:author];
    
    BOOL isSaved = [existingBooks writeToFile:filePath atomically:YES];
    if (isSaved) {
        NSLog(@"Data is added to the file");
    } else {
        NSLog(@"Data is not added to the file");
    }
}


@end
