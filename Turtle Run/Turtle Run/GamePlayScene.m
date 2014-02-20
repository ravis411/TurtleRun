//
//  GamePlayScene.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "GamePlayScene.h"


@implementation GamePlayScene : CCScene
- (id)init
{
    self = [super init];
    if (self) {
        //Add ground layer background
//        groundLayer = [GroundLayer node];
//        [self addChild:groundLayer z:0];
        
        //Add sprite layer for turtle/enemies
        spriteLayer = [SpriteLayer node];
        [self addChild:spriteLayer z:1];
        
        
    }
    return self;
}
@end
