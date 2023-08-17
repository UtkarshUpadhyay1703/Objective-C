//
//  RPSController.h
//  RockPaperScissors
//
//  Created by admin on 6/19/23.
//

#import <Cocoa/Cocoa.h>
#import "RPSTurn.h"
#import "RPSGame.h"
NS_ASSUME_NONNULL_BEGIN

@interface RPSController : NSViewController
-(void) throwDown:(Move) move;
@property RPSGame *game;

- (NSString *)resultString:(RPSGame *)game;
-(NSString*)messageForGame:(RPSGame*)game;
@end

NS_ASSUME_NONNULL_END
