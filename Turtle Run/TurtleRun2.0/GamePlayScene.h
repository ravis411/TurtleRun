//
//  GamePlayScene.h
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "HelloWorldLayer.h"
#import "CCScene.h"
#import "SpriteLayer.h"
#import "GroundLayer.h"
#import "IntroLayer.h"
//#import "GroundLayer.h"
//#import "SpriteLayer.h"
#import "SimpleAudioEngine.h"
#import "UILayer.h"
#import "GameOverLayer.h"


@interface GamePlayScene : CCScene {
    
    SpriteLayer *spriteLayer;
    UILayer *uiLayer;
    int m_Level;
    int m_Lives;
    int m_WeaponLevel;
    int m_Score;
    //    int m_DeadObstacles;
    //    GroundLayer *groundLayer;
    //    IntroLayer *introLayer;
    ALuint soundEffectID;
    
}

@property int level;
@property int lives;
@property int weaponLevel;
@property int deadObstacles;
@property int score;

-(void) startGameOver;
-(void) update:(ccTime)dt;
-(void) exitScene;

@end
