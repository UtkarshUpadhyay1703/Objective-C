//
//  pageViewController.m
//  Page View Controller and Image Sliding
//
//  Created by admin on 5/26/23.
//

#import "pageViewController.h"
#import "ViewController.h"
@interface pageViewController (){
    NSArray *arrImg;
}

@end

@implementation pageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrImg=[[NSArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five", nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//Helper Method
-(UIViewController *) viewControllerAtIndex:(NSUInteger) index{
    UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"view"];
    view1.strImg = arrImg[index];
    view1.valueIndex = index;
    return  view1;
}
-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
}
-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
}

@end
