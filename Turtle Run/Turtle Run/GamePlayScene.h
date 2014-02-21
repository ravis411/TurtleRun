//
//  GamePlayScene.h
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "CCScene.h"
#import "SpriteLayer.h"
#import "GroundLayer.h"
#import "IntroLayer.h"
//#import "GroundLayer.h"
//#import "SpriteLayer.h"
#import "SimpleAudioEngine.h"

@interface GamePlayScene : CCScene {
    
    SpriteLayer *spriteLayer;
//    GroundLayer *groundLayer;
//    IntroLayer *introLayer;
    
}

-(void) update:(ccTime)dt;

@end
