//
//  TurtleAttackLayer.h
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TurtleAttack.h"
@interface TurtleAttackLayer : CCLayer {
    NSMutableArray* attackCollection;
}
-(void) update:(ccTime)dt;
-(void) addAttack:(int)speed start:(CGPoint)startPos degree:(int)deg;
@end
