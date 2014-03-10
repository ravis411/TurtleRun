//
//  LeaderBoardLayer.m
//  TurtleRun
//
//  Created by Eric Liu on 3/10/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "LeaderBoardLayer.h"

UIButton *doneButton;

@implementation LeaderBoardLayer
+(CCScene *) scene{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LeaderBoardLayer  *layer = [LeaderBoardLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSMutableArray *leaderList = [defaults objectForKey:@"LeaderboardNames"];
        NSArray *allLeaderScores = [leaderList allKeys];
        // NSArray *sortedLeaderScores = [self sortLeaderBoard:allLeaderScores leaderDict:newLeaderList];
        CCLabelTTF *leadersLabel = [CCLabelTTF labelWithString:@"Leaders:" fontName:@"ArialMT" fontSize:22];
        leadersLabel.position = ccp(size.width/2, size.height-170);
        leadersLabel.visible = YES;
        
        [self addChild:leadersLabel];
        
        NSArray *sortedLeaderScores = [allLeaderScores sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = (NSString *)obj1;
            NSString *str2 = (NSString *)obj2;
            
            NSString *value1 = [leaderList objectForKey:str1];
            NSString *value2 = [leaderList objectForKey:str2];
            
            return [value1 compare:value2 options:NSNumericSearch];
            
        }];

        
        int leaderScoreCount = [leaderList count];
        if (leaderScoreCount>5) {
            int counter=0;
            for (int i=(leaderScoreCount-1); i>=(leaderScoreCount-6); i--) {
                NSString *currentLeader = [sortedLeaderScores objectAtIndex:i];
                NSString *currentLeaderScore = [leaderList objectForKey:[sortedLeaderScores objectAtIndex:i]];
                NSString *currentLeaderString = [NSString stringWithFormat:@"USER: %@ ----- SCORE: %@",currentLeader,currentLeaderScore];
                
                CCLabelTTF *currentLeaderLabel = [CCLabelTTF labelWithString:currentLeaderString fontName:@"ArialMT" fontSize:14];
                
                switch (counter) {
                    case 0:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-220);
                        break;
                    case 1:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-250);
                        break;
                    case 2:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-280);
                        break;
                    case 3:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-310);
                        break;
                    case 4:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-340);
                        break;
                    default:
                        break;
                }
                
                currentLeaderLabel.visible = YES;
                [self addChild:currentLeaderLabel];
                counter++;
            }
        }
        else{
            int counter=0;
            for (int i=(leaderScoreCount-1); i>=0; i--) {
                //        NSObject *currentLeader = [leaderList objectAtIndex:i];
                //        NSLog([newLeaderList objectForKey:[sortedLeaderScores objectAtIndex:i]]);
                NSString *currentLeader = [sortedLeaderScores objectAtIndex:i];
                NSString *currentLeaderScore = [leaderList objectForKey:[sortedLeaderScores objectAtIndex:i]];
                NSString *currentLeaderString = [NSString stringWithFormat:@"USER: %@ ----- SCORE: %@",currentLeader,currentLeaderScore];
                
                CCLabelTTF *currentLeaderLabel = [CCLabelTTF labelWithString:currentLeaderString fontName:@"ArialMT" fontSize:14];
                
                switch (counter) {
                    case 0:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-220);
                        break;
                    case 1:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-250);
                        break;
                    case 2:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-280);
                        break;
                    case 3:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-310);
                        break;
                    case 4:
                        currentLeaderLabel.position = ccp(size.width/2, size.height-340);
                        break;
                    default:
                        break;
                }
                
                currentLeaderLabel.visible = YES;
                [self addChild:currentLeaderLabel];
                counter++;
            }
        }
        
        doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [doneButton addTarget:self
                       action:@selector(exitScene)
             forControlEvents:UIControlEventTouchDown];
        [doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        doneButton.frame = CGRectMake(80.0, 440.0, 160.0, 40.0);
        
        [[[[CCDirector sharedDirector] openGLView] window] addSubview:doneButton];
    

    }
    return self;
}

-(void) exitScene{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.0 scene:[HelloWorldLayer scene]]];
    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
    [doneButton removeFromSuperview];
    
}
@end
