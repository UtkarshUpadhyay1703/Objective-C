//
//  ViewController.m
//  DeepFreezeTest
//
//  Created by admin on 2/5/24.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "TwoFactorAuthentication.h"
#import "TwoFactorDistributedViewController.h"
#import "LeftMenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self segmentedAction:0];
	NSLog(@"device id = %@", [self getDeviceID]);
	NSLog(@"device id = %@", getVenderIdentifier());
//	const unsigned char *bytes = (const unsigned char *)getVenderIdentifier().bytes;
//	NSLog(@"device id = %@", bytes);
	NSLog(@"device getModel = %@", [self getModel]);
}


- (IBAction)leftMenuShowHide:(id)sender {
//	LeftMenuViewController *leftMenuVC;
//	for (UIViewController *vc in self.childViewControllers)
//	{
//		if ([vc isKindOfClass:[LeftMenuViewController class]])
//		{
//			leftMenuVC = vc;
//		}
//	}
	BOOL showMenu = self.centralView.frame.origin.x == 0;
	NSLog(@"showMenu = %d \n self.centralView.frame.origin.x = %f \n self.centralView.frame.origin.y = %f \n self.leftMenu.frame.origin.x = %f \n self.leftMenu.frame.origin.y = %f", showMenu, self.centralView.frame.origin.x, self.centralView.frame.origin.y, self.leftMenu.frame.origin.x, self.leftMenu.frame.origin.y);
//	CGSize size = [[UIScreen mainScreen] bounds].size;
//	UIView *shadow;
//	shadow.frame = CGRectMake(0, 0, size.width, size.height);
//	shadow.backgroundColor = showMenu ? [UIColor clearColor] : [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
//	[self.centralView bringSubviewToFront:shadow];
	[UIView animateWithDuration:3.3 animations:^{
		CGRect frame = self.centralView.frame;
		frame.origin.x = showMenu ? self.leftMenu.frame.size.width : 0;
		self.centralView.frame = frame;
//		self->shadow.backgroundColor = bShowMenu ? [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3] : [UIColor clearColor];
		NSLog(@"second showMenu = %d \n self.centralView.frame.origin.x = %f \n self.centralView.frame.origin.y = %f \n self.leftMenu.frame.origin.x = %f \n self.leftMenu.frame.origin.y = %f", showMenu, self.centralView.frame.origin.x, self.centralView.frame.origin.y, self.leftMenu.frame.origin.x, self.leftMenu.frame.origin.y);
	}];
}

- (IBAction)twoFactorDistributedAction:(id)sender {
	TwoFactorDistributedViewController *twoFactor = [self.storyboard instantiateViewControllerWithIdentifier:@"Two_Factor_Distributed"];
	[self.navigationController pushViewController:twoFactor animated:YES];
}

- (IBAction)twoFactorAction:(id)sender {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	TwoFactorAuthentication *twoFactorViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Two_factor"];
//	[self presentViewController:twoFactorViewController animated:YES completion:nil];
	[self.navigationController pushViewController:twoFactorViewController animated:YES];
}

- (IBAction)signInAction:(id)sender {
	NSLog(@"I will print email and password");
	self.textViewOutlet.text = [NSString stringWithFormat:@"Email = %@ \n pass = %@", self.emailOutlet.text, self.passwordOutlet.text];
}

- (IBAction)segmentedAction:(id)sender {
	
	switch (self.segmentedOutlet.selectedSegmentIndex) {
		case 0:
			self.emailOutlet.hidden = NO;
			self.passwordOutlet.hidden = NO;
			self.domainOutlet.hidden = YES;
			
			self.emailPassHeight.constant = 30;
			self.domainHeight.constant = 0;
			break;
		case 1:
			self.emailOutlet.hidden = NO;
			self.passwordOutlet.hidden = NO;
			self.domainOutlet.hidden = NO;
			
			self.emailPassHeight.constant = 30;
			self.domainHeight.constant = 30;
			break;
		default:
			self.emailOutlet.hidden = YES;
			self.passwordOutlet.hidden = YES;
			self.domainOutlet.hidden = YES;
//			CGRect emailFrame = self.emailOutlet.frame;
//			emailFrame.size.height = 0;
//			self.emailOutlet.frame = emailFrame;
//
//			CGRect passFrame = self.passwordOutlet.frame;
//			passFrame.size.height = 0;
//			self.passwordOutlet.frame = passFrame;
//
//			CGRect domainFrame = self.domainOutlet.frame;
//			domainFrame.size.height = 0;
//			self.domainOutlet.frame = domainFrame;
			self.emailPassHeight.constant = 0;
			self.domainHeight.constant = 0;
			self.emailHeight.constant = 0;
			break;
	}
}

- (NSString *) getDeviceID {
	NSUUID *vendorID = [[UIDevice currentDevice] identifierForVendor];
	NSString *deviceID = [vendorID UUIDString];
	NSLog(@"device id = %@", deviceID);
	return  deviceID;
}

-(NSString *) getModel {
	NSString *deviceModel = [[UIDevice currentDevice] model];
	NSLog(@"device Model = %@", deviceModel);
	return  deviceModel;
}

static inline NSData* getVenderIdentifier(void)
{
	static NSData *vendorIdentifierData = nil;
	static dispatch_once_t	onceToken  = 0;
	
	dispatch_once (&onceToken, ^{
		uuid_t uuid;
		NSUUID *vendorIdentifier = [[UIDevice currentDevice] identifierForVendor];
		[vendorIdentifier getUUIDBytes:uuid];
		vendorIdentifierData = [NSData dataWithBytes:uuid length:16];
	});
	
	return vendorIdentifierData;
}

@end
