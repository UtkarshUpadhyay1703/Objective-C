//
//  ViewController.m
//  KVO Notification
//
//  Created by admin on 4/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self addObserver:self forKeyPath:@"kVOName" options:NSKeyValueObservingOptionNew context:nil];
//	[[NSNotificationCenter defaultCenter] postNotificationName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#>]
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationValueChanged) name:UITextViewTextDidChangeNotification object:_notificationOutlet];
}

- (IBAction)emailChangedAction:(id)sender {
	NSLog(@"emailChangedAction = %@", self.emailOutlet.text);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
	if ([keyPath isEqualToString:@"kVOName"]) {
		NSLog(@"Value changed emailOutletVariable = %@", self.kVOName);
	}
	NSLog(@"Value changed = %@", self.kVOName);
}

- (void) notificationValueChanged {
	NSLog(@"Value changed notificationValueChanged = %@", self.notificationOutlet);
}

@end
