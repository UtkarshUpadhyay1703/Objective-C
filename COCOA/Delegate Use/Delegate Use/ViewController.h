//
//  ViewController.h
//  Delegate Use
//
//  Created by admin on 5/5/23.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSComboBoxDelegate>
- (IBAction)doSomething:(id)sender;
@property (weak) IBOutlet NSPopUpButton *effectButton;

//- (IBAction)seeChange:(id)sender;

@end

