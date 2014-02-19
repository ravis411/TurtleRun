//
//  SpriteLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "SpriteLayer.h"

@implementation SpriteLayer

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
}

@end
