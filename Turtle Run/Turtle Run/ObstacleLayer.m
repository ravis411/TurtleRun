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
        spawnWallTimer = 1000;
        //[self scheduleUpdate];
    }
   return self;
}

-(void) spawn {
    //[obstacles addObject:[Obstacle node]];
    
    [self addChild:[Obstacle node]];
}

-(void) update:(ccTime)dt {
    spawnTimer -= 1;
    spawnWallTimer -= 1;
    
    if (spawnTimer <= 0) {
        [self spawn];
        spawnTimer = 35;
    }
    if(spawnWallTimer <=0){
        spawnWallTimer = 1000;
        [self addChild:[ImoveableObjectObstacle node]];
    }
    
    for (CCNode *child in self.children) {
        bool dies = [child dies];
        if (child.position.y <= -100) {
            [self removeChild:child];
        }
        else if (dies) {
            [self removeChild:child];
        }
    }
}



-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}

-(BOOL)contains:(CGPoint)pt{
    return CGRectContainsPoint([self rect], pt);
}



@end
