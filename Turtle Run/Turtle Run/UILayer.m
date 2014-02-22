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
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        m_LevelLabel = [CCLabelTTF labelWithString:@"Level: 1" fontName:@"ArialMT" fontSize:18];
        m_LevelLabel.position = ccp(size.width/2 - 80, size.height-10);
        m_LevelLabel.visible = YES;
        [self addChild:m_LevelLabel];
        
        m_LifeLabel = [CCLabelTTF labelWithString:@"Lives: 3" fontName:@"ArialMT" fontSize:18];
        m_LifeLabel.position = ccp(size.width/2 + 80, size.height-10);
        m_LifeLabel.visible = YES;
        [self addChild:m_LifeLabel];
       // m_WeaponLabel = [CCLabelTTF labelWithString:@"Weapon: Fire" fontName:@"Marker Felt" fontSize:12];
    }
    return self;
}

-(void) update:(ccTime)dt level: (int)currentLevel lives: (int) currentLives{
    m_LevelLabel.string = [NSString stringWithFormat:@"Level: %d", currentLevel];
    m_LifeLabel.string = [NSString stringWithFormat:@"Lives: %d", currentLives];
}
@end
