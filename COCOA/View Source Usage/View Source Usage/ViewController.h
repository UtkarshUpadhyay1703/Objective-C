//
//  ViewController.h
//  View Source Usage
//
//  Created by admin on 5/9/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource,NSTableViewDelegate>
//@property (weak) IBOutlet WebView *myWebView;
@property (strong) NSArray *places;
@end

