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
        
        
        for(int i=0; i<[leaderList count]; i++){
            NSString *currentLeader = [leaderList objectAtIndex:i];
            NSString *currentLeaderScore = [defaults objectForKey:currentLeader];
            
            NSString *currentLeaderDescription = [NSString stringWithFormat:@"%@ -- %@",currentLeader, currentLeaderScore ];
            CCLabelTTF *user1label = [CCLabelTTF labelWithString:currentLeaderDescription fontName:@"ArialMT" fontSize:14];
            user1label.position = ccp(size.width/2, size.height-50-(1*10));
            user1label.visible = NO;
            [self addChild:user1label];
        }
        
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
    NSMutableArray *leaderList = [defaults objectForKey:@"LeaderboardNames"];
    
    NSLog([NSString stringWithFormat:@"\n\n\nUSERNAME: %@\n\n",strUserName]);
    
    m_GameOverLabel.visible = YES;
    

    NSMutableDictionary *dictionary;
        //TRYING TO IMPLEMENT PLIST HERE
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"LeaderBoard.plist"];
    dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:finalPath];
    
    //Save current player's score
    NSString *currentPlayerScore = [defaults objectForKey:@"currentPlayer"];
    [defaults setObject:currentPlayerScore forKey:strUserName];
    [defaults synchronize];
    
    int currentIndex=0;
//    while(currentIndex<5){
//        for (id key in dictionary){
//            currentIndex++;
//            if (currentPlayerScore > [dictionary objectForKey:key]) {
//                [dictionary removeObjectForKey:key];
//                [dictionary setValue:currentPlayerScore forKey:strUserName];
//                continue;
//            }
//            
//        }
//    }
    
//    currentIndex = 0;
    [dictionary setValue:currentPlayerScore forKey:strUserName];
//    
    [dictionary writeToFile:@"LeaderBoard.plist" atomically:YES];
    
    // displays leaderboard at gameover
    
    for (id key in dictionary) {
        NSString *currentLeader = key;
        NSString *currentLeaderScore = [dictionary objectForKey:key];
        NSString *currentLeaderString = [NSString stringWithFormat:@"USER: %@ ----- SCORE: %@",currentLeader,currentLeaderScore];

        CCLabelTTF *currentLeaderLabel = [CCLabelTTF labelWithString:currentLeaderString fontName:@"ArialMT" fontSize:14];

        switch (currentIndex) {
            case 0:
                currentLeaderLabel.position = ccp(size.width/2, size.height-100);
                break;
            case 1:
                currentLeaderLabel.position = ccp(size.width/2, size.height-130);
                break;
            case 2:
                currentLeaderLabel.position = ccp(size.width/2, size.height-160);
                break;
            case 3:
                currentLeaderLabel.position = ccp(size.width/2, size.height-190);
                break;
            case 4:
                currentLeaderLabel.position = ccp(size.width/2, size.height-220);
                break;
            default:
                break;
        }
        
        currentLeaderLabel.visible = YES;
        [self addChild:currentLeaderLabel];
        ++currentIndex;
    }


    
//    if( [leaderList count]<5){
//        for(int i=0; i<[leaderList count]; i++){
//            NSString *currentPlayerScore = [defaults objectForKey:@"currentPlayer"];
//            NSString *currentLeaderScore = [defaults objectForKey:[leaderList objectAtIndex:i]];
//            if ([defaults objectForKey:@"currentPlayer"] > currentLeaderScore) {
//                //[leaderList insertObject:userName atIndex:i];
//            }
//            [leaderList addObject:strUserName];
//            [defaults setObject:currentPlayerScore forKey:strUserName];
//            [defaults synchronize];
//        }
//    }
//    
//    NSString *currentPlayerScore = [defaults objectForKey:@"currentPlayer"];
//    [leaderList addObject:strUserName];
//    [defaults setObject:currentPlayerScore forKey:strUserName];
//    [defaults synchronize];
//
//    for(int i=0; i<[leaderList count]; i++){
//        NSString *currentLeader = [leaderList objectAtIndex:i];
//        NSString *currentLeaderScore = [defaults objectForKey:currentLeader];
//        NSString *currentLeaderString = [NSString stringWithFormat:@"USER: %@ ----- SCORE: %@",currentLeader,currentLeaderScore];
//        
//        CCLabelTTF *currentLeaderLabel = [CCLabelTTF labelWithString:currentLeaderString fontName:@"ArialMT" fontSize:14];
//        
//        switch (i) {
//            case 0:
//                currentLeaderLabel.position = ccp(size.width/2, size.height-100);
//                break;
//            case 1:
//                currentLeaderLabel.position = ccp(size.width/2, size.height-130);
//                break;
//            case 2:
//                currentLeaderLabel.position = ccp(size.width/2, size.height-160);
//                break;
//            case 3:
//                currentLeaderLabel.position = ccp(size.width/2, size.height-190);
//                break;
//            case 4:
//                currentLeaderLabel.position = ccp(size.width/2, size.height-220);
//                break;
//            default:
//                break;
//        }
//        
//        currentLeaderLabel.visible = YES;
//        [self addChild:currentLeaderLabel];
//
//    }
//
//    [defaults synchronize];
    
    
    
    
}
@end
