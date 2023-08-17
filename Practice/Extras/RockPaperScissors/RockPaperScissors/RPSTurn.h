//
//  RPSTurn.h
//  RockPaperScissors
//
//  Created by admin on 6/19/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface RPSTurn : NSView

typedef NS_ENUM(NSInteger,Move){
    MoveRock,
    MovePaper,
    MoveScissors,
    Invalid
};
@property (nonatomic) Move move;
-(instancetype)initWithMove:(Move) move;

-(Move) generateMove;
-(BOOL) defeats:RPSTurn;

-(NSString *) description;

@end

NS_ASSUME_NONNULL_END
