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
        //CCMoveTo *moveAction = [CCMoveTo actionWithDuration:5.0 position:ccp(self.position.x, -100)];
        //[self runAction:moveAction];
        [self scheduleUpdate];
    }
    return self;
}

//basic southward movement shared by all Obstacles
-(void) travel {
    self.position = ccpAdd(self.position, CGPointMake(0,-2));
}

-(void) update:(ccTime)dt {
   [self travel];
   
    //self.position = ccpAdd(self.position, CGPointMake(0,-1 * dt));
    if (self.position.y < 100) {
        
    }
    //   CGPoint velocity = CGPointMake(0,-1);
   // self.position = ccpAdd(self.position,velocity);
}

@end