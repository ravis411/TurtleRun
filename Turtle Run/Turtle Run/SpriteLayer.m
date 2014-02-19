//
//  SpriteLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "SpriteLayer.h"

@implementation SpriteLayer
<<<<<<< HEAD

-(id)init
{
    self = [super init];
    if (self) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        spriteSpeed = 100;
        obstacle = [CCSprite spriteWithFile:@"clawg.png"];
        
        [self addChild:obstacle];
        
        obstacle.position = ccp(obstacle.contentSize.width/2, size.height - obstacle.contentSize.height/2);
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
=======
    
- (id)init
{
    self = [super init];
    if (self) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        [self addChild:background];
        
        self.isTouchEnabled = YES;
        m_Turtle = [Turtle node];
        [self addChild:m_Turtle];
    }
    return self;
>>>>>>> d2b61dd6d5e1c5130ebd83f8cc6152854df79291
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
