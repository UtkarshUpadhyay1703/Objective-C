//
//  ViewController.h
//  DeepFreezeTest
//
//  Created by admin on 2/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailOutlet;

@property (weak, nonatomic) IBOutlet UITextField *passwordOutlet;
@property (weak, nonatomic) IBOutlet UITextView *textViewOutlet;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedOutlet;
@property (weak, nonatomic) IBOutlet UITextField *domainOutlet;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailPassHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *domainHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailHeight;

//MARK: Views
@property (weak, nonatomic) IBOutlet UIView *leftMenu;
@property (weak, nonatomic) IBOutlet UIView *centralView;



- (IBAction)segmentedAction:(id)sender;
- (IBAction)signInAction:(id)sender;
- (IBAction)twoFactorAction:(id)sender;
- (IBAction)twoFactorDistributedAction:(id)sender;
- (IBAction)leftMenuShowHide:(id)sender;

@end

