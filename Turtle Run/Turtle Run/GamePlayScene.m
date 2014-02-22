//
//  GamePlayScene.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "GamePlayScene.h"


@implementation GamePlayScene : CCScene

@synthesize level = m_Level;
@synthesize lives = m_Lives;
@synthesize weaponLevel = m_WeaponLevel;
@synthesize deadObstacles = m_DeadObstacles;

- (id)init
{
    self = [super init];
    if (self) {
        //Add ground layer background
//        groundLayer = [GroundLayer node];
//        [self addChild:groundLayer z:0];
        
        //Add sprite layer for turtle/enemies
        [[SimpleAudioEngine sharedEngine] playEffect:@"fireandflames.mp3"];
        spriteLayer = [SpriteLayer node];
        [self addChild:spriteLayer z:1];
        
        uiLayer = [UILayer node ];
        [self addChild:uiLayer z:2];
        
        m_Level = 1;
        m_Lives = 3;
        m_WeaponLevel = 1;
        m_DeadObstacles = 0;
        
        [self scheduleUpdate];
    }
    return self;
}

-(void) turtleHit{
    m_Lives--;
}

-(void) update:(ccTime)dt {
    [spriteLayer update:dt];
    
    int numEnemiesToCompleteLevel;
    
    switch (m_Level) {
        case 1:
            numEnemiesToCompleteLevel = 10;
            break;
        case 2:
            numEnemiesToCompleteLevel = 15;
            break;
        case 3:
            numEnemiesToCompleteLevel = 20;
            break;
        case 4:
            numEnemiesToCompleteLevel = 25;
            break;
        case 5:
            numEnemiesToCompleteLevel = 30;
            break;
            
        default:
            break;
    }
    if(m_DeadObstacles >= numEnemiesToCompleteLevel){
        m_Level++;
    }
    [uiLayer update:dt level:m_Level lives:m_Lives];
    
}

@end
