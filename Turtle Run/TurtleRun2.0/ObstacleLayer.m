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
        spawnTimerReset = 35;
        currentLevel = 1;
        //[self scheduleUpdate];
    }
    return self;
}

-(void) spawn:(int)level {
    NSLog(@"level %d", level);
//    NSLog(@"Spawn");
    //[obstacles addObject:[Obstacle node]];
    Obstacle *o = [Obstacle node];
    currentLevel = level;
    if(level ==1)
        [o setType:1 level:1];
    else if(level==2){
        [o setType:arc4random()%level+1 level:level];
    }
    else if(level==3){
        [o setType:arc4random()%level+1 level:level];
    }
    else if(level==4){
        [o setType:arc4random()%level+1 level:level];
    }
    else{
        currentLevel = level;
        [o setType:arc4random()%4+1 level:level];
    }
    [self addChild:o];
}

-(void)setSpawnTimerReset:(int)count{
    spawnTimerReset = count;
}

-(void)update:(ccTime)dt level:(int)lvl {
    spawnTimer -= 1;
    spawnWallTimer -= 1;
    
    if (spawnTimer <= 0) {
        [self spawn:lvl];
        spawnTimer = spawnTimerReset-5*currentLevel;
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
