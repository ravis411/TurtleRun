//
//  Cannon.m
//  TurtleRun
//
//  Created by Kyle on 3/10/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "Cannon.h"

@implementation Cannon

- (id)init
{
    self = [super init];
    if (self) {
        for (int i = 0; i<=5; i++) {
            NSString *frameName = [NSString stringWithFormat:@"cannon_%d.png", i];
            [frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName]];
        }
        
        yPosition = 50;
//        winSize = [[CCDirector sharedDirector] winSize];
//        self.position = m_MoveToPoint = ccp(winSize.width/2, yPosition);
        [self setDisplayFrame:frames[0]];
    }
    return self;
}

@end
