//
//  DrawingRectangle.m
//  Mouse Events Test
//
//  Created by admin on 6/14/23.
//

#import "DrawingRectangle.h"

@implementation DrawingRectangle

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSLog(@"Draw");
    [NSColor redColor];
    NSRectFill(dirtyRect);
    [[NSColor blueColor] set];
//    [[NSBezierPath bezierPathWithRect:NSMakeRange(self.startPoint.x, self.startPoint.y,self.endPoint.x-self.startPoint.x,self.endPoint.y-self.startPoint.y)] fill];
//    [[NSBezierPath bezierPathWithRect:NSMakeRange(_startPoint.x, _endPoint.x)] fill];
}

-(void) keyDown:(NSEvent *)event{
    if([[event characters] isEqualToString:@"O"]){
        NSLog(@"O dabaya");
    }
}

-(void) mouseDown:(NSEvent *)event{
    self.startPoint = [event locationInWindow];
    NSLog(@"Mouse Dabaya");
}
-(void) mouseDragged:(NSEvent *)event{
    self.endPoint = [event locationInWindow];
    NSLog(@"Drag aaya where x = %f and y = %f",self.endPoint.x,self.endPoint.y);
    [self setNeedsLayout:YES];
}
@end
