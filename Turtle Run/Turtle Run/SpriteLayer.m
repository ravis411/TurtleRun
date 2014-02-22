//
//  SpriteLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "SpriteLayer.h"
//#import "Obstacle.h"//need this to check for colisions

@implementation SpriteLayer
    
- (id)init
{
    self = [super init];
    if (self) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        [self addChild:background];
        
        self.touchEnabled = YES;
        m_Turtle = [Turtle node];
        [self addChild:m_Turtle];
        
        m_ObstacleLayer = [ObstacleLayer node];
        [self addChild:m_ObstacleLayer];
        
        m_TurtleAttackLayer = [TurtleAttackLayer node];
        [self addChild:m_TurtleAttackLayer];
        
        
    }
    return self;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if (draggingTurtle) {
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    //[m_Turtle setPosition:location];
        [m_Turtle dragTurtle:location];
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    draggingTurtle = NO;
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    //See if the touch location is on the turtle.
        //If it is, and the user drags, the turtle should move where they drag.
    if ([m_Turtle contains:(location)]) {
        draggingTurtle = YES;
        return YES;
    }
    
    //If they did not touch the turtle have the turtle move to whereever they clicked.
    m_Turtle.moveToPoint = location;
    return YES;
}

- (void) registerWithTouchDispatcher {
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}




-(void)detectColissions{
    //Loop through all children of ObstacleLayer
    for (CCNode *child in m_ObstacleLayer.children) {
        //Make sure the child is an Obstacle
        if ( [child isKindOfClass:[Obstacle class] ]) {
            if ( CGRectIntersectsRect([m_Turtle rect], [child rect])) {
                //The turtle got hit!?
                [child hit:100];
            }
        }
    }
}




-(void) update:(ccTime)dt {
    [self detectColissions];
    [m_Turtle update:dt];
    if(m_Turtle.readyToFire)
        [m_TurtleAttackLayer addAttack:10 start:m_Turtle.position];
    [m_ObstacleLayer update:dt];
    [m_TurtleAttackLayer update:dt];
}

- (void)dealloc
{
    [super dealloc];
}
@end
