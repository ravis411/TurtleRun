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

- (id)init
{
    self = [super initWithFile:@"clawg_64x64.png"];
    if (self) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        self.position = ccp(arc4random_uniform(size.width), 450);
    }
    return self;
}

//basic southward movement shared by all Obstacles
-(void) travel:(ccTime)dt {
    self.position = ccp(self.position.x, self.position.y - dt*obstacleSpeed);
}
-(void) update:(ccTime)dt {
    [self travel:dt];
}

@end
