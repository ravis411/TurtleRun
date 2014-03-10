//
//  TutorialScene.h
//  TurtleRun
//
//  Created by Student on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "CCLayer.h"
#import "CCSprite.h"
#import "HelloWorldLayer.h"




@interface TutorialScene : CCLayer{
    
    CGSize size;
    CCLabelTTF *backLabel;
    CCSprite *img;
    
}

@end