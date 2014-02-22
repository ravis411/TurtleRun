//
//  Turtle.h
//  Turtle Run
//
//  Created by Eric Liu on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCSprite.h"
#import "AppDelegate.h"

@interface Turtle : CCSprite
{
    CGPoint m_Direction;
    CGPoint m_MoveToPoint; //The point the turtle should move to
    CGSize winSize;//The size of the window
    int speed; //Speed of turtle
    float yPosition; //The y value of the position should always be the same
    
    enum turtleWeapon{
        fire,
        ice,
        lightning
    };
    
    enum turtleWeapon weaponState;
    
    int m_weaponLevel;
}

@property CGPoint direction;
@property int weaponLevel;
@property CGPoint moveToPoint;//The point the turtle should move to.

-(void) update:(ccTime)dt;
-(void) setupAnim;
-(CGRect) rect;
-(void) shootWeapon;
-(BOOL) contains:(CGPoint)pt;//returns true if the point is within the turtle
-(void) dragTurtle:(CGPoint)pt;//Called when the user drags the turtle
@end
