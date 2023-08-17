//
//  ViewController.h
//  FileData
//
//  Created by admin on 26/05/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *titleText;

@property (weak) IBOutlet NSTextField *authorText;
- (IBAction)addBookToFile:(id)sender;

@end

