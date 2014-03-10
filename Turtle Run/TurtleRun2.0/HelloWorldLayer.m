//
//  HelloWorldLayer.m
//  TurtleRun2.0
//
//  Created by Ryan on 3/8/14.
//  Copyright TeamTurtleRun 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "GamePlayScene.h"


#pragma mark - HelloWorldLayer


@interface HelloWorldLayer()
-(void) createMenu;
@end


// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        CGSize size = [[CCDirector sharedDirector] winSize];

        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Turtle Run" fontName:@"Marker Felt" fontSize:48];
		[self addChild:label z:0];
		[label setColor:ccc3(120,255,120)];
		label.position = ccp( size.width/2, size.height-75);
        
        //BATCHING TURTLE SPRITES
        CCSpriteBatchNode *turtleAtlasNode;
        turtleAtlasNode = [CCSpriteBatchNode batchNodeWithFile:@"turtlesheet.png"];
        [self addChild:turtleAtlasNode];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"turtlesheet.plist"];
        
        NSMutableArray *turtleAnimFrames = [NSMutableArray array];
        for (int i = 0; i <= 8; i++) {
            NSString *file = [NSString stringWithFormat:@"turtle%d.png", i];
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:file];
            [turtleAnimFrames addObject:frame];
        }
        
        //BATCHING ADDITIONAL SPRITES
        CCSpriteBatchNode *firstAtlasNode;
        firstAtlasNode = [CCSpriteBatchNode batchNodeWithFile:@"atlas0.png"];
        [self addChild:firstAtlasNode];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"atlas0.plist"];
        
        NSMutableArray *firstAtlasFrames = [NSMutableArray array];
        NSArray *firstAtlasFilenames = [NSArray arrayWithObjects:@"blast.png", @"cannon_0.png", @"cannon_1.png", @"cannon_2.png", @"cannon_3.png", @"cannon_4.png", @"clawg.png", @"fpsup.png", @"oneup.png", @"scatterup.png", @"splode.png", nil];
        for (int i = 0; i <= 10; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:firstAtlasFilenames[i]];
            [firstAtlasFrames addObject:frame];
        }

        
        
		[self createMenu];
        
        [self scheduleUpdate];
		

	}
	return self;
}




#import "BackgroundLayer.h"
#import "Turtle.h"

-(void) update:(ccTime)dt{
    for (CCNode *s in self.children) {
        [s update:dt];
    }
    
}



-(void) createMenu
{
	
    Turtle *turtle = [Turtle node];
    BackgroundLayer *background = [BackgroundLayer node];
    
    [self addChild:background z:-2];
    [self addChild:turtle z:-1];
    
    
    
    // Default font size will be 22 points.
	[CCMenuItemFont setFontSize:22];
    
	// to avoid a retain-cycle with the menuitem and blocks
	__block id copy_self = self;
    
	CGSize size = [[CCDirector sharedDirector] winSize];
    
    
    
    
    
    
    // Achievement Menu Item using blocks
    CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
        
        
        GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
        achivementViewController.achievementDelegate = copy_self;
        
        AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
        
        [[app navController] presentModalViewController:achivementViewController animated:YES];
        
        [achivementViewController release];
    }];
    
    // Leaderboard Menu Item using blocks
    CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
        
        
        GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
        leaderboardViewController.leaderboardDelegate = copy_self;
        
        AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
        
        [[app navController] presentModalViewController:leaderboardViewController animated:YES];
        
        [leaderboardViewController release];
    }];

    
    
    
    
    //Start New Game
    
    CCMenuItem *itemNewGame = [CCMenuItemFont itemWithString:@"New Game" block:^(id sender) {
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.0 scene:[GamePlayScene node]]];
    }];
	
	CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, itemNewGame, nil];
	
//	[menu alignItemsVertically];
    [menu alignItemsVerticallyWithPadding:25.0f];
	
	
	[menu setPosition:ccp( size.width/2, size.height/2)];
	
	
	[self addChild: menu z:-1];
    
    
}
























// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
