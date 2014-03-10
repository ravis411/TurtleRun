//
//  TutorialScene.m
//  TurtleRun
//
//  Created by Student on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "TutorialScene.h"

@implementation TutorialScene

- (id)init
{
    self = [super init];
    if (self) {
        size = [[CCDirector sharedDirector] winSize];

        /*
        turtle = [Turtle node];
        background = [BackgroundLayer node];
        
        m_Level = 1;
        m_Lives = 2;
        m_WeaponLevel = 1;
        
        
        [self addChild:turtle];
        [self addChild:background z:-1];
        [self scheduleOnce:@selector(displayMovementInstructions1) delay:5];

        
        
        [self scheduleUpdate];
        */
        
        if(size.height == 480){
        img = [CCSprite spriteWithFile:@"tutorial-iphone4r.png" rect:CGRectMake(0, 0, size.width, size.height)];
        }else{
            img = [CCSprite spriteWithFile:@"tutorial-iphone5.png" rect:CGRectMake(0, 0, size.width, size.height)];
        }
        
        
        img.anchorPoint = ccp(0, 0);
        img.position = ccp(0, 0);
        [self addChild:img z:-1];
        
        self.touchEnabled = YES;
        
        backLabel = [CCLabelTTF labelWithString:@"<-Back" fontName:@"ArialMT" fontSize:20];
        backLabel.color = ccc3(120,255,120);
        backLabel.position = ccp(0, size.height-100);
        backLabel.anchorPoint = ccp(0, 0);
        backLabel.visible = YES;
        [self addChild:backLabel];
        
    }
    return self;
}


/*
-(void)update:(ccTime)dt{
    
    /*[turtle update:dt];
    [background update:dt];
    
}
*/

/*

-(void)displayMovementInstructions1{
    label = [CCLabelTTF labelWithString:@"Tap anywhere on screen to move the turtle..." fontName:@"ArialMT" fontSize:20 dimensions:CGSizeMake(size.width - 50, size.height/2) hAlignment:kCCTextAlignmentCenter lineBreakMode:kCCLineBreakModeWordWrap];
    label.color = ccc3(120,255,120);
    label.position = ccp(size.width/2, size.height/2);
    label.visible = YES;
    [self addChild:label];
    [self scheduleOnce:@selector(removeLabel) delay:5];
    [self scheduleOnce:@selector(displayMovementInstructions2) delay:8];

}

-(void)displayMovementInstructions2{

    
    label = [CCLabelTTF labelWithString:@"Or drag the turtle where you want it to go." fontName:@"ArialMT" fontSize:20 dimensions:CGSizeMake(size.width - 50, size.height/2) hAlignment:kCCTextAlignmentCenter lineBreakMode:kCCLineBreakModeWordWrap];
    label.color = ccc3(120,255,120);
    label.position = ccp(size.width/2, size.height/2);
    label.visible = YES;
    [self addChild:label];
    
    [self scheduleOnce:@selector(removeLabel) delay:7];
}








-(void) removeLabel{
    [self removeChild:label cleanup:YES];
}






-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if(true){
        if (draggingTurtle) {
            CGPoint location = [touch locationInView:[touch view]];
            location = [[CCDirector sharedDirector] convertToGL:location];
            //[m_Turtle setPosition:location];
            [turtle dragTurtle:location];
        }
    }
}






-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    draggingTurtle = NO;
}
*/


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    /*
    //See if the touch location is on the turtle.
    //If it is, and the user drags, the turtle should move where they drag.
    if ([turtle contains:(location)]) {
        draggingTurtle = YES;
        return YES;
    }
     
     
         //If they did not touch the turtle have the turtle move to whereever they clicked.
    turtle.moveToPoint = location;
    return YES;

     
     
     */
    //Exit the scene
    if(location.x >= backLabel.position.x && location.x <= backLabel.position.x + backLabel.contentSize.width && location.y >= backLabel.position.y && location.y <= backLabel.position.y + backLabel.contentSize.height){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[HelloWorldLayer scene]]];
        [[CCTouchDispatcher sharedDispatcher] setDispatchEvents:YES];
    }
}

- (void) registerWithTouchDispatcher {
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}





@end












