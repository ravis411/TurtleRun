//
//  Turtle.m
//  Turtle Run
//
//  Created by Eric Liu on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "Turtle.h"

@implementation Turtle

@synthesize direction = m_Direction;
@synthesize weaponLevel = m_weaponLevel;
@synthesize moveToPoint = m_MoveToPoint;
@synthesize readyToFire = m_ReadyToFire;

- (id)init
{
    self = [super initWithFile:@"turtle_150x150.png"];
    if (self) {
        spriteRest = false;
        updateCount = 0;
        yPosition = 50;
        speed = 400;
        m_ReadyToFire = NO;
        winSize = [[CCDirector sharedDirector] winSize];
        self.position = m_MoveToPoint = ccp(winSize.width/2, yPosition);
        weaponState = ice;
        m_weaponLevel = 1;
        shootingRate = 20;
        cannonCount = 1;
        animframe = 0;
    }
    return self;
}


-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}

-(BOOL)contains:(CGPoint)pt{
    return CGRectContainsPoint([self rect], pt);
}

-(void)dragTurtle:(CGPoint)pt{
    self.position = self.moveToPoint = ccp(pt.x, yPosition);
}

-(void) update:(ccTime)dt{
    updateCount=updateCount+ 1;
    if(updateCount>shootingRate){
        self.readyToFire = YES;
        updateCount = 0;
    }
    else{
        self.readyToFire = NO;
    }
    
    if (spriteRest) {
        spriteRest = false;
    }
    else {
    animframe++;
        if (animframe > 8) {animframe = 0;}
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                                spriteFrameByName:[NSString stringWithFormat:@"turtle%d.png", animframe]];
        [self setDisplayFrame:frame];
        spriteRest = true;
    }

    
    //CGSize size = [[CCDirector sharedDirector] winSize];
    
    //This if block checks to make sure the turtle needs to move someplace
    // Mostly for if user taps screen
    if ( ccpDistance(self.position, m_MoveToPoint) != 0 ) {
        //Make sure the point to move to has the correct y value
        if(m_MoveToPoint.y != yPosition){
            m_MoveToPoint.y = yPosition;
        }
        
        if (self.position.x < m_MoveToPoint.x) {
            self.position = ccp(self.position.x + dt * speed, yPosition);
            if (self.position.x > m_MoveToPoint.x) {
                self.position = ccp(m_MoveToPoint.x, yPosition);
                
            }
        }
        else if (self.position.x > m_MoveToPoint.x){
            self.position = ccp(self.position.x - dt * speed, yPosition);
            if (self.position.x < m_MoveToPoint.x) {
                self.position = ccp(m_MoveToPoint.x, yPosition);
                
            }
        }
    }//end user tap if block
}

-(void)changeShootingPauses:(int)amount{
    shootingRate+=amount;
}
-(int)getCannonCount{
    return cannonCount;
}
-(void)incrementCannonCount:(int)value{
    cannonCount+=value;
}



@end
