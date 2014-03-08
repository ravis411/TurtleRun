//
//  TurtleAttack.h
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TurtleAttack : CCSprite {
    CGSize winSize;//The size of the window
    int travelSpeed;
    CGPoint startPos;
}
-(void) travel;
-(id)initAttack:(int)speed pos:(CGPoint)point;
-(CGRect)rect;
@end
