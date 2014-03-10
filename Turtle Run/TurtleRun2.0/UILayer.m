//
//  UILayer.m
//  Turtle Run
//
//  Created by Eric Liu on 2/21/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "UILayer.h"

@implementation UILayer

- (id)init
{
    self = [super init];
    if (self) {
        size = [[CCDirector sharedDirector] winSize];
        
        m_LevelLabel = [CCLabelTTF labelWithString:@"Level: 1" fontName:@"ArialMT" fontSize:25];
        m_LevelLabel.position = ccp(50, size.height-15);
        m_LevelLabel.visible = YES;
        [self addChild:m_LevelLabel];
        
//        m_LifeLabel = [CCLabelTTF labelWithString:@"Lives: 3" fontName:@"ArialMT" fontSize:18];
//        m_LifeLabel.position = ccp(size.width/2 + 80, size.height-10);
//        m_LifeLabel.visible = YES;
//        [self addChild:m_LifeLabel];
        // m_WeaponLabel = [CCLabelTTF labelWithString:@"Weapon: Fire" fontName:@"Marker Felt" fontSize:12];
        
        
        m_EnemyKilledLabel = [CCLabelTTF labelWithString:@"Kills: 0" fontName:@"ArialMT" fontSize:15];
        m_EnemyKilledLabel.position = ccp(size.width - 47, size.height-37);
        m_EnemyKilledLabel.visible = YES;
        [self addChild:m_EnemyKilledLabel];
        
        m_TotalScore = [CCLabelTTF labelWithString:@"Score: 0" fontName:@"ArialMT" fontSize:15];
        m_TotalScore.position = ccp(60, size.height-35);
        m_TotalScore.visible = YES;
        [self addChild:m_TotalScore];
        
        m_GameOverLabel = [CCLabelTTF labelWithString:@"Game Over" fontName:@"ArialMT" fontSize:34];
        m_GameOverLabel.position = ccp(size.width/2, size.height/2);
        m_GameOverLabel.visible = NO;
        [self addChild:m_GameOverLabel];
        heartCount = [[NSMutableArray alloc]init];
        for(int i=0;i<3;i++){
            CCSprite *heart = [CCSprite spriteWithFile:@"heart.png"];
            heart.position = ccp(size.width -17 - (30*i), size.height-15);
            [heartCount addObject:heart];
            [self addChild:heart];
        }
    }
    return self;
}

-(void)showGameOverLabel{
    m_GameOverLabel.visible = YES;
}

-(void) update:(ccTime)dt level:(int) currentLevel lives:(int)currentLives killed:(int)currentKilled score:(double)s{
    m_LevelLabel.string = [NSString stringWithFormat:@"Level: %d", currentLevel];
//    m_LifeLabel.string = [NSString stringWithFormat:@"Lives: %d", currentLives];
    if(currentLives != heartCount.count){
        //remove all other
        for(CCSprite* s in heartCount){
            [self removeChild:s];
        }
        [heartCount removeAllObjects];
        
        for(int i=0;i<currentLives;i++){
            CCSprite *heart = [CCSprite spriteWithFile:@"heart.png"];
            heart.position = ccp(size.width -17 - (30*i), size.height-15);
            [heartCount addObject:heart];
            [self addChild:heart];
        }
    }
    m_EnemyKilledLabel.string = [NSString stringWithFormat:@"Kills: %d", currentKilled];
    m_TotalScore.string = [NSString stringWithFormat:@"Score: %i", (int)s];
}
@end
