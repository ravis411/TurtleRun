//
//  TurtleAttack.m
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
//

#import "TurtleAttack.h"


@implementation TurtleAttack



-(id)init{
    self = [super initWithFile:@"blast.png"];
    if (self) {
        winSize = [[CCDirector sharedDirector] winSize];
        self.position = ccp(winSize.width/2, 350);
        
    }
    return self;
}

-(id)initAttack:(int)speed pos:(CGPoint)point degree:(int)argumentDeg{
    self = [super initWithFile:@"blast.png"];
    if (self) {
        degree = argumentDeg;
        winSize = [[CCDirector sharedDirector] winSize];
        self.position = point;
        travelSpeed = speed;
        
    }
    return self;
}

-(void) travel {
    int bufferedDeg = degree/10;
    self.position = ccpAdd(self.position, CGPointMake(bufferedDeg,travelSpeed));
}

-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}



@end
