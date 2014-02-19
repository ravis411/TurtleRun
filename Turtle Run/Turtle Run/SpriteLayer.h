//
//  SpriteLayer.h
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCLayer.h"
<<<<<<< HEAD
#import "cocos2d.h"
#import <GameKit/GameKit.h>

@interface SpriteLayer : CCLayer {
    CCSprite* obstacle;
    CCMoveTo* moveAction;
    int spriteSpeed;
=======
#import "GroundLayer.h"
#import "Turtle.h"

@interface SpriteLayer : CCLayer {
    Turtle *m_Turtle;
>>>>>>> d2b61dd6d5e1c5130ebd83f8cc6152854df79291
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;

-(void)dealloc;
@end
