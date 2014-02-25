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
}

-(id) init;
-(void)spawn;
-(void)clean;
-(void)update:(ccTime)dt;

@end
