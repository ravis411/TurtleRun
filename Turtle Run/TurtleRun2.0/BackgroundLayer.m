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
        backgroundList = [[NSMutableArray alloc]init];
        int totalheight = 0;
        while(totalheight<size.height*1.7){
            CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
            background.position = ccp(size.width/2, totalheight);
            [self addChild:background];
            [backgroundList addObject:background];
            totalheight += [background boundingBox].size.height;
        }
        //        CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
        //        background.position = ccp(size.width/2, 0);
        //        [self addChild:background];
        //        [backgroundList addObject:background];
    }
    
    return self;
}

-(void) update:(ccTime)dt {
    CCSprite* removableBackground = nil;
    for(CCSprite* cs in backgroundList){
        cs.position = ccpAdd(cs.position, CGPointMake(0,-1));
        int checkHeight =cs.position.y + cs.boundingBox.size.height;
        if(checkHeight<0){
            removableBackground = cs;
        }
    }
    if(removableBackground != nil){
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
        CCSprite *last = [backgroundList lastObject];
        background.position = ccp(size.width/2, (last.position.y+last.boundingBox.size.height));
        [self addChild:background];
        [backgroundList addObject:background];
        [backgroundList removeObject:removableBackground];
        [self removeChild:removableBackground];
    }
}

@end
