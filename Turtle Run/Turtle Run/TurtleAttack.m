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

-(id)initAttack:(int)speed pos:(CGPoint)point{
    self = [super initWithFile:@"blast.png"];
    if (self) {
        winSize = [[CCDirector sharedDirector] winSize];
        self.position = point;
        travelSpeed = speed;
        
    }
    return self;
}

-(void) travel {
    self.position = ccpAdd(self.position, CGPointMake(0,travelSpeed));
}



@end
