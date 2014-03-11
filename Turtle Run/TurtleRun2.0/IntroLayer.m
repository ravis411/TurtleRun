//
//  IntroLayer.m
//  TurtleRun2.0
//
//  Created by Ryan on 3/8/14.
//  Copyright TeamTurtleRun 2014. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "HelloWorldLayer.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(id) init
{
	if( (self=[super init])) {

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

		CCSprite *background;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"Default.png"];
			background.rotation = 90;
		} else {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);

		// add the label as a child to this Layer
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        NSMutableDictionary *leaderList = [[NSMutableDictionary alloc] init];
//        
//        //    UserModel *leader1 = [[UserModel alloc]init];
//        //    UserModel *leader2 = [[UserModel alloc] init];
//        //
//        //    [leader1 setUserName:@"Eric"];
//        //    [leader1 setScore:@"250"];
//        //
//        //    [leader2 setUserName:@"Player 2"];
//        //    [leader2 setScore:@"120"];
//        [leaderList setObject:@"20" forKey:@"Player 2"];
//        //    [leaderList setObject:@"250" forKey:@"Eric"];
//        //    [leaderList setObject:@"370" forKey:@"Andrew"];
//        [leaderList setObject:@"382" forKey:@"Kyle"];
//        [leaderList setObject:@"540" forKey:@"Ryan"];
//        
//        
//        [defaults setObject:leaderList forKey:@"LeaderboardNames"];
//        [defaults synchronize];
        
		[self addChild: background];
	}
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] ]];
}
@end
