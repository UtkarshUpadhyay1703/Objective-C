//
//  RPSController.m
//  RockPaperScissors
//
//  Created by admin on 6/19/23.
//

#import "RPSController.h"

@interface RPSController ()

@end

@implementation RPSController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
-(void) throwDown:(Move) move{
    RPSTurn *playersTurn = [[RPSTurn alloc] initWithMove:move];
    RPSTurn *computersTurn = [[RPSTurn alloc] init];
    self.game = [[RPSGame alloc] initWithFirstTurn:playersTurn secondTurn:computersTurn];
}

-(NSString*)messageForGame:(RPSGame*)game {
    // Handle the tie
      if (game.firstTurn.move == game.secondTurn.move) {
          return @"It's a tie!";
      } else {
      
          // Here we build up the results message "Rock crushes Scissors. You Win!" etc.
          NSString *winnerString = [[game winner] description];
          NSString *loserString = [[game loser]  description];
          NSString *resultsString = [self resultString: game];
      
          NSString *wholeString =  [NSString stringWithFormat:@"%@ %@ %@ %@ %@", winnerString, @" defeats ", loserString, @".",  resultsString];
      
          return wholeString;
       }
    }
- (NSString *)resultString:(RPSGame *)game {
    // Implement the logic to determine the result and return a formatted string
    // based on the game's outcome
    return @"Some result string";
}

@end
