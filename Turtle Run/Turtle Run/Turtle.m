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

- (id)init
{
    self = [super initWithFile:@"turtle_150x150.png"];
    if (self) {
        yPosition = 50;
        speed = 300;
        
        winSize = [[CCDirector sharedDirector] winSize];
        self.position = m_MoveToPoint = ccp(winSize.width/2, yPosition);
        weaponState = ice;
        m_weaponLevel = 1;
    }
    return self;
}

-(void) update:(ccTime)dt{
    //CGSize size = [[CCDirector sharedDirector] winSize];
    
    //This if block checks to make sure the turtle needs to move someplace
        // Mostyle for if user taps screen
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
    }
    
    //This if block will be for dragging the turtle on the screen
    
    
    
    
}
@end
