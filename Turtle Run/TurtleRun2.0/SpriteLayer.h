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
#import "BackgroundLayer.h"
#import "PowerUpLayer.h"

@interface SpriteLayer : CCLayer {
    bool draggingTurtle; //For when the user is dragging the turtle.
    Turtle *m_Turtle;
    ObstacleLayer *m_ObstacleLayer;
    TurtleAttackLayer *m_TurtleAttackLayer;
    PowerUpLayer *m_PowerUpLayer;
    int m_TurtleLives;
    BOOL gameOver;
    BackgroundLayer *m_BackgroundLayer;
    int powerUpProbability;
    int currentLevel;
}


@property int enemiesKilled;
@property int totalEnemiesKilled;
@property int turtleLives;


//Not sure if this is necessary cuz it works without it.
//-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;

//Will loop through all obstacles and check for collisions
-(void) detectCollisions;

-(void) clearChildren;

-(void) update:(ccTime)dt;

-(void)dealloc;

-(void)level:(int)level;
-(void)setLevel:(int)lvl;
@end
