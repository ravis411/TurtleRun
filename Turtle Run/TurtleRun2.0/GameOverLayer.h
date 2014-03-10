//
//  GameOverLayer.h
//  TurtleRun2.0
//
//  Created by Eric Liu on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "CCLayer.h"
#import "AppDelegate.h"

@interface GameOverLayer : CCLayer
{
    CCLabelTTF *m_GameOverLabel;

}

+(CCScene *)scene;
-(void) promptForUsername;
-(void) updateLeaderBoard;
@end
