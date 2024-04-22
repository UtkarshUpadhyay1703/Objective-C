//
//  ViewController.h
//  KVO Notification
//
//  Created by admin on 4/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailOutlet;

@property (weak, nonatomic) IBOutlet UITextField *kVOName;
@property (weak, nonatomic) IBOutlet UITextField *notificationOutlet;

- (IBAction)emailChangedAction:(id)sender;

@end

