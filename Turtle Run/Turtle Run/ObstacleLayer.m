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
        [self scheduleUpdate];
    }
   return self;
}

-(void) spawn {
    [self addChild:[Obstacle node]];
}

-(void) update:(ccTime)dt {
    spawnTimer -= 1;
    if (spawnTimer <= 0) {
        [self spawn];
        spawnTimer = 50;
    }
}


@end
