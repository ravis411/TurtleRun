//
//  SpriteLayer.h
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCLayer.h"
#import "GroundLayer.h"
#import "Turtle.h"

@interface SpriteLayer : CCLayer {
    Turtle *m_Turtle;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;

-(void)dealloc;
@end
