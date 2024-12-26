//
//  TwoFactorAuthentication.h
//  DeepFreezeTest
//
//  Created by admin on 3/18/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TwoFactorAuthentication : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *otpField;

- (IBAction)generateOtpNotification:(id)sender;
@end

NS_ASSUME_NONNULL_END
