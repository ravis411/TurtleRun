//
//  Obstacle.h
//  Turtle Run
//
//  Created by Kyle on 2/19/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCSprite.h"
#import "cocos2d.h"



@interface Obstacle : CCSprite {
    CCTexture2D *texSplode;
    BOOL leftToRightVelocity;
    int obstacleSpeed;

}

@property int hp;
@property BOOL diagonalType;

//+ (int) speed;
-(void) hit:(int)damage;
-(bool) dies;
-(void) splode;
-(id) init;
-(void) travel:(ccTime)dt;
-(void) update:(ccTime)dt;
-(void) dealloc;
-(CGRect) rect;
-(BOOL) contains:(CGPoint)pt;//returns true if the point is within the obstacle
-(void)setType:(int)typeValue level:(int)lvl;
@end
