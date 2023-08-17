//
//  RPSTurn.m
//  RockPaperScissors
//
//  Created by admin on 6/19/23.
//

#import "RPSTurn.h"

@implementation RPSTurn

-(instancetype)initWithMove:(Move) move {
    self = [super init];
    if (self){
        _move = move;
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self){
        _move = [self generateMove];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(Move)generateMove {
    NSUInteger randomNumber = arc4random_uniform(3);
    switch (randomNumber){
        case 0:
            return MoveRock;
            break;
        case 1:
            return MovePaper;
            break;
        case 2:
            return MoveScissors;
            break;
        default:
            return Invalid;
            break;
    }
    return MoveRock;
}

-(BOOL) defeats:(RPSTurn *)opponent {
    if((self.move == MovePaper && opponent.move == MoveRock)||(self.move == MoveScissors && opponent.move == MovePaper) || (self.move == MoveRock && opponent.move == MoveScissors)){
        return true;
    }else return false;
    
    return false;
}

-(NSString *) description{
    switch (self.move) {
        case MoveRock:
            return @"Rock";
            break;
        case MovePaper:
            return @"Paper";
            break;
        case MoveScissors:
            return @"Scissors";
            break;
        case Invalid:
            return @"Invalid";
            break;
    }
}
@end
