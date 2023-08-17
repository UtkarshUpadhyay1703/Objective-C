//
//  ViewController.m
//  Audio
//
//  Created by admin on 5/26/23.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()
{
    AVAudioPlayer *player;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //here we write so that if we want to run the music in background.
}


- (IBAction)play:(id)sender {
    NSString *strpath = [[NSBundle mainBundle] pathForResource:@"JaiShreeRam" ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:strpath];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [player play];
}
@end
