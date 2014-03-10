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
@synthesize gamesPlayed = m_GamesPlayed;

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
        soundEffectID = [[SimpleAudioEngine sharedEngine] playEffect:@"fireandflames.mp3"];
        spriteLayer = [SpriteLayer node];
        [self addChild:spriteLayer z:1];
        
        uiLayer = [UILayer node ];
        [self addChild:uiLayer z:2];
        
        m_Level = 1;
        m_Lives = 3;
        m_WeaponLevel = 1;
        //        m_DeadObstacles = 0;
        m_Score = 0;
        startGameOverFlag = NO;
        
        self.gamesPlayed = 0;
        
        
        [self scheduleUpdate];
    }
    return self;
}



-(void) update:(ccTime)dt {
    
    [spriteLayer update:dt];
    
    if(m_Lives == 0 && startGameOverFlag==NO){
        [spriteLayer clearChildren];
        [self startGameOver];
        startGameOverFlag = YES;
    }
    
    m_Lives = spriteLayer.turtleLives;
    
    int numEnemiesToCompleteLevel = 5 + m_Level * 5;

    if(spriteLayer.enemiesKilled >= numEnemiesToCompleteLevel){
        m_Level++;
        [spriteLayer setLevel:m_Level];
        spriteLayer.enemiesKilled = 0;
    }
    [uiLayer update:dt level:m_Level lives:m_Lives killed:spriteLayer.totalEnemiesKilled score:spriteLayer.totalScore];
    
    
//    [uiLayer update:dt level:m_Level lives:m_Lives score:m_Score];
    
}

-(void)startGameOver{
    //    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:NO];
    //    [uiLayer showGameOverLabel];
    //    [self scheduleOnce:@selector(exitScene) delay:3];
    
    
    
    int currentPlayerScore = spriteLayer.totalScore;
    NSString *strCurrentPlayerScore = [NSString stringWithFormat:@"%d", currentPlayerScore];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSMutableDictionary *leaderList = [[NSMutableDictionary alloc] init];
//    
////    UserModel *leader1 = [[UserModel alloc]init];
////    UserModel *leader2 = [[UserModel alloc] init];
////    
////    [leader1 setUserName:@"Eric"];
////    [leader1 setScore:@"250"];
////    
////    [leader2 setUserName:@"Player 2"];
////    [leader2 setScore:@"120"];
//    [leaderList setObject:@"20" forKey:@"Player 2"];
////    [leaderList setObject:@"250" forKey:@"Eric"];
////    [leaderList setObject:@"370" forKey:@"Andrew"];
//    [leaderList setObject:@"382" forKey:@"Kyle"];
//    [leaderList setObject:@"540" forKey:@"Ryan"];
//    
//    
//    [defaults setObject:leaderList forKey:@"LeaderboardNames"];
    [defaults setObject:strCurrentPlayerScore forKey:@"currentPlayer"];
    
//    for(int i=0; i<[leaderList count];i++){
//        NSString *name = [NSString stringWithFormat:@"Leader %d",i];
//        [defaults setObject:[leaderList objectAtIndex:i] forKey:name];
//    }
    
    [defaults synchronize];
    
        
    [[SimpleAudioEngine sharedEngine] stopEffect:soundEffectID];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:0.5 scene:[GameOverLayer scene]]];
    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
    
    ++self.gamesPlayed;
}

-(void) exitScene{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[HelloWorldLayer scene]]];
    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
}

@end
