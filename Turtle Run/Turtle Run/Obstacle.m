//
//  Obstacle.m
//  Turtle Run
//
//  Created by Kyle on 2/19/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "Obstacle.h"
static int obstacleSpeed = 10;

@implementation Obstacle
+ (int) speed {return obstacleSpeed;}

//basic southward movement shared by all Obstacles
-(void) travel {
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    
}
-(void) update:(ccTime)dt {
    //[self travel];
}

@end
