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

//-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
//    CGPoint location = [touch locationInView:[touch view]];
//    location = [[CCDirector sharedDirector] convertToGL:location];
//  //  [m_Turtle setPosition:location];
//}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    m_Turtle.moveToPoint = location;
    return YES;
}

- (void) registerWithTouchDispatcher {
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}


-(void) update:(ccTime)dt {
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
