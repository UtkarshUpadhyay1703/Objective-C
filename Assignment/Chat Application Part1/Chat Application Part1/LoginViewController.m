//
//  LoginViewController.m
//  Chat Application Part1
//
//  Created by admin on 5/31/23.
//

#import "LoginViewController.h"
#import "ChatViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)login:(id)sender {
    NSString *user = [self.userName stringValue];
    NSLog(@"user name = %@",user);
    if(user.length>0){
        //Saving the name into the file
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentDirectory = [paths firstObject];
//        NSString *filePath = [documentDirectory stringByAppendingPathComponent:@"Teacher.plist"];
//
//        NSMutableDictionary *allTeachers = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
//        if (allTeachers == nil) {
//            allTeachers = [NSMutableDictionary dictionary];
//        }
//        [allTeachers setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#> ];
//        [allTeachers writeToFile:filePath atomically:YES];
        
    ChatViewController *chatViewController = [[ChatViewController alloc] initWithUserName:user];
        [self presentViewControllerAsModalWindow:chatViewController];
    }
}
@end
