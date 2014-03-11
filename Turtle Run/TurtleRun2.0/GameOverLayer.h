//
//  GameOverLayer.h
//  TurtleRun2.0
//
//  Created by Eric Liu on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "CCLayer.h"
#import "AppDelegate.h"
#import "HelloWorldLayer.h"

@interface GameOverLayer : CCLayer
{
    CCLabelTTF *m_GameOverLabel;
    
}

@property NSString *currentPlayerScore;
+(CCScene *)scene;
-(void) promptForUsername;
-(void) updateLeaderBoard;
-(void) exitScene;
-(void) recordCurrentPlayerScore: (NSString *)currentScore;
-(void) showLeaderScores;
@end
