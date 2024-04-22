//
//  TwoFactorAuthentication.m
//  DeepFreezeTest
//
//  Created by admin on 3/18/24.
//

#import "TwoFactorAuthentication.h"
#import "SuccessLoginViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface TwoFactorAuthentication ()

@end

@implementation TwoFactorAuthentication

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyboard) name:UITextFieldTextDidChangeNotification object:_otpField];
	[self.otpField becomeFirstResponder];
}

- (void) showKeyboard {
	if (self.otpField.text.length == 4) {
		if ([self.otpField.text isEqual: @"5638"]) {
			SuccessLoginViewController *successLoginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Success_Login"];
			[self clearOtpField];
			[self.navigationController pushViewController:successLoginVC animated:YES];
		} else {
			self.otpField.text = @"Wrong OTP";
			[self performSelector:@selector(clearOtpField) withObject:nil afterDelay:1];
		}
	}
}

- (void) clearOtpField {
	self.otpField.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) getNotificationPermission {
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert| UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
		if (!granted) {
			NSLog(@"Not granted the permission for Notification");
		}
	}];
}

- (IBAction)generateOtpNotification:(id)sender {
//	SuccessLoginViewController *successVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Success_Login"];
//	[self.navigationController pushViewController:successVC animated:YES];
	[self getNotificationPermission];
	NSString* title = @"OTP";
	NSString* body = @"Hope you are having a good time \n the otp Passcode is 5638 \n please never share this otp with anyone other than me 😅😅";
	[self generateNotification:title body:body];
}

- (void) generateNotification: (NSString *)title body:(NSString *)body {
	UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
	content.title = title;
	content.body = body;
	content.sound = [UNNotificationSound defaultSound];
//	UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
	UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"generateNotification" content:content trigger:nil];
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
		if (error) {
			NSLog(@"Error scheduling notification: %@", error);
		}
	}];
}
@end
