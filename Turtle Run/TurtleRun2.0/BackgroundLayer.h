//
//  BackgroundLayer.h
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BackgroundLayer : CCLayer {
    NSMutableArray* backgroundList;
}

-(void) update:(ccTime)dt;

@end
