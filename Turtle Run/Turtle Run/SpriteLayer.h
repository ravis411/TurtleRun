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
#import "ObstacleLayer.h"

@interface SpriteLayer : CCLayer {
    bool draggingTurtle; //For when the user is dragging the turtle.
    Turtle *m_Turtle;
    Obstacle *m_ObstacleLayer;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;

-(void) update:(ccTime)dt;

-(void)dealloc;
@end
