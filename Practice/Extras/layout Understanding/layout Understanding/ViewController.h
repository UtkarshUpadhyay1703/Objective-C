//
//  ViewController.h
//  layout Understanding
//
//  Created by admin on 5/26/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//We are declaring 2 outlets 1 for segment and 1 for image view
@property (weak, nonatomic) IBOutlet UISegmentedControl *segOut;
@property (weak, nonatomic) IBOutlet UIImageView *img;

//We are declaring 1 action for segment
- (IBAction)segAct:(id)sender;
//For second thing
@property (weak, nonatomic) IBOutlet UIImageView *viewImage;

@end

