//
//  ViewController.h
//  DN impl Client
//
//  Created by admin on 6/5/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

//@property (strong) NSString *filePath;
//@property (strong) NSMutableDictionary *student;

@property (weak) IBOutlet NSTextField *username;

- (IBAction)login:(id)sender;

@end

