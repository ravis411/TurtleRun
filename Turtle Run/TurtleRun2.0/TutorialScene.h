//
//  TutorialScene.h
//  TurtleRun
//
//  Created by Student on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import "CCScene.h"
#import "CCLayer.h"
#import "Turtle.h"
#import "BackgroundLayer.h"
#import "UILayer.h"
#import "HelloWorldLayer.h"







@interface TutorialScene : CCLayer{
    
    CGSize size;
    BackgroundLayer *background;
    Turtle *turtle;
    CCLabelTTF *backLabel;
    CCLabelTTF *label;
    
    bool draggingTurtle; //For when the user is dragging the turtle.

    
    int m_Level;
    int m_Lives;
    int m_WeaponLevel;
    
}


-(void) update:(ccTime)dt;

@end