//
//  TurtleAttackLayer.m
//  Turtle Run
//
//  Created by Andrew Han on 2/21/14.
//  Copyright 2014 USC. All rights reserved.
//

#import "TurtleAttackLayer.h"


@implementation TurtleAttackLayer
-(id)init{
    self = [super init];
    if (self) {
        attackCollection = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void) update:(ccTime)dt{
    NSMutableArray* removeAttacks = [[NSMutableArray alloc]init];
     CGSize size = [[CCDirector sharedDirector] winSize];
    for(TurtleAttack *ta in attackCollection){
        if(ta.position.y>size.height){
            [removeAttacks addObject:ta];
//            [attackCollection removeObject:ta];
//            [self removeChild:ta];
        }
        else
            [ta travel];
    }
    for(TurtleAttack *ta in removeAttacks){
        [attackCollection removeObject:ta];
        [self removeChild:ta];
    }
}

-(void) addAttack:(int)speed start:(CGPoint)startPos{
    NSLog(@"Adding Attack");
    TurtleAttack* attack = [[TurtleAttack alloc]initAttack:speed pos:startPos];
    [self addChild:attack];
    [attackCollection addObject:attack];
}

@end
