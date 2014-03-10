//
//  GameOverLayer.m
//  TurtleRun2.0
//
//  Created by Eric Liu on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "GameOverLayer.h"

UITextField *userName;
NSString *strUserName;
UIButton *doneButton;

@implementation GameOverLayer
+(CCScene *) scene{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOverLayer  *layer = [GameOverLayer node];
	
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
        
        m_GameOverLabel = [CCLabelTTF labelWithString:@"Game Over" fontName:@"ArialMT" fontSize:34];
        m_GameOverLabel.position = ccp(size.width/2, size.height-50);
        m_GameOverLabel.visible = NO;
        
        [self addChild:m_GameOverLabel];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSMutableArray *leaderList = [defaults objectForKey:@"LeaderboardNames"];
        
        doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [doneButton addTarget:self
                   action:@selector(exitScene)
         forControlEvents:UIControlEventTouchDown];
        [doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        doneButton.frame = CGRectMake(80.0, 440.0, 160.0, 40.0);
        
        [[[[CCDirector sharedDirector] openGLView] window] addSubview:doneButton];
        

        
        [self promptForUsername];
       
        
    }
    return self;
}

-(void) promptForUsername{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:@"Enter Your Name"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    
    
    [alert show];
    
    
    
    
    [alert release];
    
    //[self updateLeaderBoard:strUserName];
    
    
    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //u need to change 0 to other value(,1,2,3) if u have more buttons.then u can check which button was pressed.
    
    if (buttonIndex == 0) {
        
        userName = [alertView textFieldAtIndex:0];
        strUserName = userName.text;
        [self updateLeaderBoard];
        
        
    }
    
    
    
}

-(void) updateLeaderBoard{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *leaderList = [defaults objectForKey:@"LeaderboardNames"];
    
    
    
    m_GameOverLabel.visible = YES;
    
    
//    NSDictionary *oldDictionary;
//    NSMutableDictionary *dictionary;
//    //TRYING TO IMPLEMENT PLIST HERE
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSString *finalPath = [path stringByAppendingPathComponent:@"LeaderBoard.plist"];
//    oldDictionary = [NSDictionary dictionaryWithContentsOfFile:finalPath];
//    dictionary = [oldDictionary mutableCopy];
    
    //Save current player's score
    NSString *currentPlayerScore = [defaults objectForKey:@"currentPlayer"];
    [defaults setObject:currentPlayerScore forKey:strUserName];
    [defaults synchronize];
    
    NSMutableDictionary *newLeaderList = [leaderList mutableCopy];
    NSLog(@"\n\n\nCURRENT PLAYER SCORE: %@",currentPlayerScore);
    [newLeaderList setObject:currentPlayerScore forKey:strUserName];
    [defaults synchronize];
    
    [defaults setObject:newLeaderList forKey:@"LeaderboardNames"];
    [defaults synchronize];
    NSLog(@"\n\n\n calling gameoover \n\n\n");
    
    NSString *yourScoreSTR = [NSString stringWithFormat:@"Your Score: %@", currentPlayerScore];
    CCLabelTTF *yourScoreLabel = [CCLabelTTF labelWithString:yourScoreSTR fontName:@"ArialMT" fontSize:22];
    yourScoreLabel.position = ccp(size.width/2, size.height-100);
    yourScoreLabel.visible = YES;
    
    [self addChild:yourScoreLabel];
    
    CCLabelTTF *leadersLabel = [CCLabelTTF labelWithString:@"Leaders:" fontName:@"ArialMT" fontSize:22];
    leadersLabel.position = ccp(size.width/2, size.height-170);
    leadersLabel.visible = YES;
    
    [self addChild:leadersLabel];
    
  //  NSMutableArray *leaderList = [defaults objectForKey:@"LeaderboardNames"];

//    NSArray *allLeaderScores = [newLeaderList allValues];
    NSArray *allLeaderScores = [newLeaderList allKeys];
   // NSArray *sortedLeaderScores = [self sortLeaderBoard:allLeaderScores leaderDict:newLeaderList];
    
    NSArray *sortedLeaderScores = [allLeaderScores sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = (NSString *)obj1;
            NSString *str2 = (NSString *)obj2;
        
        NSString *value1 = [newLeaderList objectForKey:str1];
        NSString *value2 = [newLeaderList objectForKey:str2];
        
        return [value1 compare:value2 options:NSNumericSearch];
        
    }];
    

    
    int leaderScoreCount = [sortedLeaderScores count];
    if (leaderScoreCount>5) {
        int counter=0;
        for (int i=(leaderScoreCount-1); i>=(leaderScoreCount-6); i--) {
            NSString *currentLeader = [sortedLeaderScores objectAtIndex:i];
            NSString *currentLeaderScore = [newLeaderList objectForKey:[sortedLeaderScores objectAtIndex:i]];
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
            NSString *currentLeaderScore = [newLeaderList objectForKey:[sortedLeaderScores objectAtIndex:i]];
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
    
    [defaults synchronize];
    
//    [self schedule:@selector(exitScene) interval:3];
    
}

-(void) exitScene{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.0 scene:[HelloWorldLayer scene]]];
    [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
    [doneButton removeFromSuperview];

}


@end
