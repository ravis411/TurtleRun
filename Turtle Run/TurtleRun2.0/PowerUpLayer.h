//
//  PowerUpLayer.h
//  TurtleRun2.0
//
//  Created by Andrew Han on 3/8/14.
//  Copyright 2014 TeamTurtleRun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PowerUp.h"

@interface PowerUpLayer : CCLayer {
    NSMutableArray *powerUpList;
}

-(void)dropItem:(CGRect)rect;

@end
