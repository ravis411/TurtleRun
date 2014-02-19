//
//  SpriteLayer.h
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import <GameKit/GameKit.h>

@interface SpriteLayer : CCLayer {
    CCSprite* obstacle;
    CCMoveTo* moveAction;
    int spriteSpeed;
}

@end
