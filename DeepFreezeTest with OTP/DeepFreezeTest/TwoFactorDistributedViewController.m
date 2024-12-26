//
//  TwoFactorDistributedViewController.m
//  DeepFreezeTest
//
//  Created by admin on 3/21/24.
//

#import "TwoFactorDistributedViewController.h"
#import "SuccessLoginViewController.h"

@interface TwoFactorDistributedViewController ()

@end

@implementation TwoFactorDistributedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self.otp1Field becomeFirstResponder];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(showKeyboard:)
												 name:UITextViewTextDidChangeNotification
											   object:_otp1Field];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(showKeyboard:)
												 name:UITextViewTextDidChangeNotification
											   object:_otp2Field];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(showKeyboard:)
												 name:UITextViewTextDidChangeNotification
											   object:_otp3Field];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(showKeyboard:)
												 name:UITextViewTextDidChangeNotification
											   object:_otp4Field];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) showKeyboard: (NSNotification *)notification {
	UITextView *textView = notification.object;
	NSString *text = textView.text;
	if (text.length == 1) {
		if (notification.object == self.otp1Field) {
			[self.otp2Field becomeFirstResponder];
		} else if (notification.object  == self.otp2Field) {
			[self.otp3Field becomeFirstResponder];
		} else if (notification.object  == self.otp3Field) {
			[self.otp4Field becomeFirstResponder];
		} else if (notification.object  == self.otp4Field) {
			[self.otp4Field resignFirstResponder];
		}
	}
	
	if (![self.otp1Field.text isEqual: @""] && ![self.otp2Field.text isEqual: @""] && ![self.otp3Field.text isEqual: @""] && ![self.otp4Field.text isEqual: @""]) {
		SuccessLoginViewController *successVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Success_Login"];
		[self.navigationController pushViewController:successVC animated:YES];
	}
}

@end
