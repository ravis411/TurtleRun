//
//  UILayer.h
//  Turtle Run
//
//  Created by Eric Liu on 2/21/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCLayer.h"
#import "AppDelegate.h"

@interface UILayer : CCLayer
{
    CCLabelTTF *m_LevelLabel;
    CCLabelTTF *m_LifeLabel;
    CCLabelTTF *m_WeaponLabel;
}
-(void) update:(ccTime)dt level:(int) currentLevel lives:(int)currentLives;
@end
