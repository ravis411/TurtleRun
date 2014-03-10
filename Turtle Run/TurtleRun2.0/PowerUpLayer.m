//
//  PowerUpLayer.m
//  TurtleRun2.0
//
//  Created by Andrew Han on 3/8/14.
//  Copyright 2014 TeamTurtleRun. All rights reserved.
//

#import "PowerUpLayer.h"


@implementation PowerUpLayer

-(id) init {
    if (self = [super init]){
        powerUpList = [[NSMutableArray alloc]init];
        //[self scheduleUpdate];
    }
    return self;
}


-(void) update:(ccTime)dt {
    CGSize size = [[CCDirector sharedDirector] winSize];
    NSMutableArray *removeList = [[NSMutableArray alloc]init];
    for(PowerUp *p in powerUpList){
        [p update:dt];
        if(p.position.y<0){
            [removeList addObject:p];
        }
    }
    
    for(PowerUp* u in removeList){
        [powerUpList removeObject:u];
        [self removeChild:u];
    }
}

-(void)dropItem:(CGRect)rect{
    PowerUp *pu = [PowerUp node];
    pu.position = rect.origin;
    pu.position = CGPointMake(pu.position.x+15, pu.position.y);
//    [pu setPowerUpType:arc4random()%4];
    [pu setPowerUpType:2];
    [self addChild:pu];
    [powerUpList addObject:pu];
    //make a sprite at the point
    //add sprite to the layer
}

@end
