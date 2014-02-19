//
//  SpriteLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "SpriteLayer.h"

@implementation SpriteLayer
    
- (id)init
{
    self = [super init];
    if (self) {
        
        CGSize size = [[CCDirector sharedDirector] size];
        
        m_Turtle = [Turtle node];
        [self addChild:m_Turtle];
    }
    return self;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    [m_Turtle setPosition:location];
}
- (void)dealloc
{
    [super dealloc];
}
@end
