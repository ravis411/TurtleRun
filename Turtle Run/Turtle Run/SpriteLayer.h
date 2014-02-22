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
#import "TurtleAttackLayer.h"

@interface SpriteLayer : CCLayer {
    bool draggingTurtle; //For when the user is dragging the turtle.
    Turtle *m_Turtle;
    Obstacle *m_ObstacleLayer;
    TurtleAttackLayer *m_TurtleAttackLayer;
}

@property int enemiesKilled;

//Not sure if this is necessary cuz it works without it.
//-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;

//Will loop through all obstacles and check for collisions
-(void) detectColissions;

-(void) update:(ccTime)dt;

-(void)dealloc;
@end
