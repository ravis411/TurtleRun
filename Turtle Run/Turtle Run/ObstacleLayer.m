//
//  ObstacleLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/20/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "ObstacleLayer.h"

@implementation ObstacleLayer

-(id) init {
    if (self = [super init]){
        spawnTimer = 0;
        //[self scheduleUpdate];
    }
   return self;
}

-(void) spawn {
    [obstacles addObject:[Obstacle node]];
    
    [self addChild:[Obstacle node]];
}

-(void) update:(ccTime)dt {
    spawnTimer -= 1;
    if (spawnTimer <= 0) {
        [self spawn];
        spawnTimer = 70;
    }
    
    for (CCNode *child in self.children) {
        bool dies = [child dies];
        if (child.position.y <= -100) {
            [self removeChild:child];
        }
        else if (dies) {
            [child splode];
            [self removeChild:child];
        }
    }
}


@end
