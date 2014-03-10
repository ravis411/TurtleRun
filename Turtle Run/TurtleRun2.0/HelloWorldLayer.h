//
//  HelloWorldLayer.h
//  TurtleRun2.0
//
//  Created by Ryan on 3/8/14.
//  Copyright TeamTurtleRun 2014. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "LeaderBoardLayer.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) update:(ccTime)dt;

@end
