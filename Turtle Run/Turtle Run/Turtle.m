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

- (id)init
{
    self = [super initWithFile:@"turtle_150x150.png"];
    if (self) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        self.position = ccp(size.width/2, 50);
        weaponState = ice;
        m_weaponLevel = 1;
        
    }
    return self;
}

-(void) update:(ccTime)dt{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //self.position = ccp(50, 50);
    
    //position should only be able to move in the X direction
    
    if(self.position.x > size.width){
        
    }
}
@end
