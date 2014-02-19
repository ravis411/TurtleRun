//
//  GroundLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "GroundLayer.h"

@implementation GroundLayer

-(id)init
{
    self = [super init];
    if (self) {
        CGSize  size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* ground;
        ground = [CCSprite spriteWithFile:@"tile.png"];
        ground.rotation = 0;
        ground.position = ccp(size.width/2, size.height/2);
        
        [self addChild: ground];
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

@end
