//
//  PowerUp.m
//  TurtleRun2.0
//
//  Created by Andrew Han on 3/8/14.
//  Copyright 2014 TeamTurtleRun. All rights reserved.
//

#import "PowerUp.h"


@implementation PowerUp

-(id)init{
    
    self = [super initWithFile:@"blast.png"];
    
    if (self) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //[self scheduleUpdate];
    }
    return self;
    
}

-(void) update:(ccTime)dt {
    [self travel];
}

-(void)travel{
    self.position = ccpAdd(self.position, CGPointMake(0,-1.5));
}

-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}


@end
