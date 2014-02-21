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
#import "CCLayer.h"

@interface ObstacleLayer : CCLayer

-(void)spawn;
-(void)update:(ccTime)dt;

@end
