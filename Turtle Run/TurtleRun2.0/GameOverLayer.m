//
//  GameOverLayer.m
//  TurtleRun2.0
//
//  Created by Eric Liu on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "GameOverLayer.h"

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
        m_GameOverLabel.visible = YES;
        [self addChild:m_GameOverLabel];
        
        for
    }
    return self;
}
@end
