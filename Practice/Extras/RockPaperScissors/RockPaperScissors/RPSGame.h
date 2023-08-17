//
//  RPSGame.h
//  RockPaperScissors
//
//  Created by admin on 6/19/23.
//

#import <Cocoa/Cocoa.h>
#import "RPSTurn.h"
NS_ASSUME_NONNULL_BEGIN

@interface RPSGame : NSView

//typedef NS_ENUM(NSInteger,Move){
//    MoveRock,
//    MovePaper,
//    MoveScissors
//};

@property (nonatomic) RPSTurn *firstTurn;
@property (nonatomic) RPSTurn *secondTurn;

-(instancetype)initWithFirstTurn:(RPSTurn*) playerTurn secondTurn: (RPSTurn*)computerTurn;

-(RPSTurn *) winner;
-(RPSTurn *) loser;
-(NSString*)resultString:(RPSGame*)game;
@end
NS_ASSUME_NONNULL_END
