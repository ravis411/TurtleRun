//
//  Obstacle.h
//  Turtle Run
//
//  Created by Kyle on 2/19/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCSprite.h"
#import "cocos2d.h"

@interface Obstacle : CCSprite
+ (int) speed;
-(void) travel;
-(void) update:(ccTime)dt;
@end