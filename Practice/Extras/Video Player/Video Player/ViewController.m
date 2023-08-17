//
//  ViewController.m
//  Video Player
//
//  Created by admin on 5/26/23.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){
    AVPlayer *player;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"JaiShreeRam" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:strPath];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    player = [AVPlayer playerWithPlayerItem:item];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    layer.frame = _videoPlay.layer.bounds;
    
    [_videoPlay.layer addSublayer:layer];
    [player play];
    }


@end
