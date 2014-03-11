//
//  BackgroundLayer.m
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
//

#import "BackgroundLayer.h"


@implementation BackgroundLayer
-(id) init {
  self = [super init];
    if(self){
        CGSize size = [[CCDirector sharedDirector] winSize];
        nextBackground = @"floortile.jpg";
        distance_Traveled = 0;
        backgroundList = [[NSMutableArray alloc]init];
        int totalheight = 0;
        while(totalheight<size.height*1.7){
            CCSprite *background = [CCSprite spriteWithFile:nextBackground];
            background.position = ccp(size.width/2, totalheight);
            [self addChild:background];
            [backgroundList addObject:background];
            totalheight += [background boundingBox].size.height;
        }
        //        CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
        //        background.position = ccp(size.width/2, 0);
        //        [self addChild:background];
        //        [backgroundList addObject:background];*/
    }
    
    return self;
}

-(void) update:(ccTime)dt {
    distance_Traveled++;
    
    
    CCSprite* removableBackground = nil;
    for(CCSprite* cs in backgroundList){
        cs.position = ccpAdd(cs.position, CGPointMake(0,(int)(-100*dt)));
        int checkHeight =cs.position.y + cs.boundingBox.size.height;
        if(checkHeight<0){
            removableBackground = cs;
        }
    }
   if(removableBackground != nil){
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:nextBackground];
        CCSprite *last = [backgroundList lastObject];
        background.position = ccp(size.width/2, (last.position.y+last.boundingBox.size.height));
        [self addChild:background];
        [backgroundList addObject:background];
        [backgroundList removeObject:removableBackground];
        [self removeChild:removableBackground];
    }
}

-(double)getDistancetraveled{
    return (distance_Traveled/10.00);
}


-(void) changeBackground:(int)level{
    
    if (level <= 2) {
        nextBackground = @"floortile.jpg";
    }else if(level <= 4){
        nextBackground = @"grass.png";
    }else if(level <= 6){
        nextBackground = @"sand.png";
    }
    else if (level <= 8){
        nextBackground = @"water.png";
    }
    else{
        return;
    }
}


@end
