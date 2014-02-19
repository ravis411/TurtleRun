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

-(void) update:(ccTime)dt;
-(void) setupAnim;
-(CGRect) rect;
-(void) shootWeapon;

@end
