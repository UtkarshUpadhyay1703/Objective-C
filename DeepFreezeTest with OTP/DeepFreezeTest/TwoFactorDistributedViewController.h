//
//  TwoFactorDistributedViewController.h
//  DeepFreezeTest
//
//  Created by admin on 3/21/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TwoFactorDistributedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *otp1Field;
@property (weak, nonatomic) IBOutlet UITextView *otp2Field;
@property (weak, nonatomic) IBOutlet UITextView *otp3Field;
@property (weak, nonatomic) IBOutlet UITextView *otp4Field;

@end

NS_ASSUME_NONNULL_END
