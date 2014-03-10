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
@synthesize score = m_Score;

bool startGameOverFlag = NO;

UITextField *userName;
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
        //        m_DeadObstacles = 0;
        m_Score = 0;
        
        self.date = [NSDate date];
        
        [self scheduleUpdate];
    }
    return self;
}



-(void) update:(ccTime)dt {
    //NSTimeInterval timeElapsed = [self.date timeIntervalSinceNow];
    [spriteLayer update:dt];
    
    if(m_Lives == 0 && startGameOverFlag == NO){
        [self startGameOver];
        [spriteLayer clearChildren];
        startGameOverFlag = YES;
        
    }
    
    m_Lives = spriteLayer.turtleLives;
    
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
    if(spriteLayer.enemiesKilled >= numEnemiesToCompleteLevel){
        m_Level++;
        spriteLayer.enemiesKilled = 0;
    }
    
    //m_Score = timeElapsed;
    m_Score = spriteLayer.score;
    
    
    [uiLayer update:dt level:m_Level lives:m_Lives score:m_Score];
    
}



-(void)startGameOver{
//    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:NO];
//    [uiLayer showGameOverLabel];
//    [self scheduleOnce:@selector(exitScene) delay:3];
    

    
    int currentPlayerScore = m_Score;
    NSString *strCurrentPlayerScore = [NSString stringWithFormat:@"%d", currentPlayerScore];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *leaderList = [[NSMutableArray alloc] init];
//    [leaderList addObject:@"Player 1"];
//    [leaderList addObject:@"Player 2"];
    
    [defaults setObject:leaderList forKey:@"LeaderboardNames"];
    [defaults setObject:strCurrentPlayerScore forKey:@"currentPlayer"];
    
    [defaults setObject:@"90" forKey:@"Player 1"];
    [defaults setObject:@"40" forKey:@"Player 2"];
    
    [defaults synchronize];
  
    
    NSLog(@"\n\n\n calling gameoover \n\n\n");

    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:0.5 scene:[GameOverLayer scene]]];
    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
}

-(void) exitScene{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[HelloWorldLayer scene]]];
    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
}

@end
