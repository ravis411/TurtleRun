//
//  ObstacleLayer.h
//  Turtle Run
//
//  Created by Kyle on 2/20/14.
//  Copyright (c) 2014 USC. All rights reserved.
//
/*
 Generates Obstacle sprites
 */

#import "Obstacle.h"
#import "ImoveableObjectObstacle.h"
#import "CCLayer.h"

@interface ObstacleLayer : CCLayer {
    NSMutableArray *obstacles;
    int spawnTimer;
    int spawnWallTimer;
    int spawnTimerReset;
    int currentLevel;
}

-(id) init;
-(void)spawn;
-(void)clean;
-(void)update:(ccTime)dt level:(int)lvl;
-(void)destroyTarget:(Obstacle*)target;
@end
