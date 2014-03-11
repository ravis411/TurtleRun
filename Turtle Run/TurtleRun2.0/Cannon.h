//
//  Cannon.h
//  TurtleRun
//
//  Created by Kyle on 3/10/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "CCSprite.h"
#import "AppDelegate.h"
#import "cocos2d.h"

@interface Cannon : CCSprite {
    Boolean isFiring;
    NSMutableArray *frames;
    float yPosition; //The y value of the position should always be the same
}

@end
