//
//  ViewController.h
//  DN impl Server
//
//  Created by admin on 6/5/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
//@property (strong) NSString *filePath;
//@property (strong) NSMutableDictionary *teacher;

@property (weak) IBOutlet NSTextField *username;
- (IBAction)loginButtonClicked:(id)sender;

@end

