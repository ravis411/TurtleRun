//
//  BackgroundLayer.h
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
// Testing Git - Andrew 2.0

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BackgroundLayer : CCLayer {
    NSMutableArray* backgroundList;
    NSString *nextBackground;
//    CCSpriteFrame *nextBackground;
    double distance_Traveled;
    CCSpriteFrame *concreteTile;
    CCSpriteFrame *grassTile;
    CCSpriteFrame *sandTile;
    CCSpriteFrame *waterTile;
}

-(void) update:(ccTime)dt;
-(void) changeBackground:(int)level;
-(double)getDistancetraveled;

@end
