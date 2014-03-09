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
    BOOL m_ReadyToFire;
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
    int updateCount;
    int m_weaponLevel;
    
    int shootingRate;
    int cannonCount;
}
@property BOOL readyToFire;
@property CGPoint direction;
@property int weaponLevel;
@property CGPoint moveToPoint;//The point the turtle should move to.

-(void) update:(ccTime)dt;
-(void) setupAnim;
-(CGRect) rect;
-(BOOL) contains:(CGPoint)pt;//returns true if the point is within the turtle
-(void) shootWeapon;
-(BOOL) contains:(CGPoint)pt;//returns true if the point is within the turtle
-(void) dragTurtle:(CGPoint)pt;//Called when the user drags the turtle
-(void)changeShootingPauses:(int)amount;
-(int)getCannonCount;
-(void)incrementCannonCount:(int)value;
@end
