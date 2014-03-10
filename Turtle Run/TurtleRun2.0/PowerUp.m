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
-(void)setPowerUpType:(int)value{
    switch (value) {
        case 0:
            type = weapons;
            [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"scatterup.png"]];
            break;
        case 1:
            type = shootingAbility;
            [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"fpsup.png"]];
            break;

        case 2:
            type = lives;
            [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"oneup.png"]];
            break;
            
        case 3:
            type = bomb;
            break;
            
        default:
            break;
    }
}

-(void) update:(ccTime)dt {
    self.position = ccpAdd(self.position, CGPointMake(0,-150*dt));
}


-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}

-(int)getPowerUpType{
    switch (type) {
        case weapons:
            return 0;
            break;
        case shootingAbility:
            return 1;
            break;
            
        case lives:
           return 2;
            break;
            
        case bomb:
            return 3;
            break;
            
        default:
            break;
    }

}




@end
