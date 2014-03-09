//
//  SpriteLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//
#define POWERUP_SHOOTING_DECREMENT -3
#define POWERUP_CHANCE 35
#import "SpriteLayer.h"
//#import "Obstacle.h"//need this to check for colisions

@implementation SpriteLayer

@synthesize turtleLives = m_TurtleLives;

- (id)init
{
    self = [super init];
    if (self) {
        self.enemiesKilled = 0;
        //        CGSize size = [[CCDirector sharedDirector] winSize];
        powerUpProbability = POWERUP_CHANCE;
        m_BackgroundLayer = [BackgroundLayer node];
        [self addChild:m_BackgroundLayer];
        
        //        CCSprite *background = [CCSprite spriteWithFile:@"floortile.jpg"];
        //        background.position = ccp(size.width/2, size.height/2);
        //
        //        [self addChild:background];
        
        self.touchEnabled = YES;
        m_Turtle = [Turtle node];
        [self addChild:m_Turtle];
        
        m_ObstacleLayer = [ObstacleLayer node];
        [self addChild:m_ObstacleLayer];
        
        m_TurtleAttackLayer = [TurtleAttackLayer node];
        [self addChild:m_TurtleAttackLayer];
        
        m_PowerUpLayer = [PowerUpLayer node];
        [self addChild:m_PowerUpLayer];
        
        m_TurtleLives = 3;
        gameOver = NO;
        
    }
    return self;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    if(!gameOver){
        if (draggingTurtle) {
            CGPoint location = [touch locationInView:[touch view]];
            location = [[CCDirector sharedDirector] convertToGL:location];
            //[m_Turtle setPosition:location];
            [m_Turtle dragTurtle:location];
        }
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    draggingTurtle = NO;
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    //See if the touch location is on the turtle.
    //If it is, and the user drags, the turtle should move where they drag.
    if ([m_Turtle contains:(location)]) {
        draggingTurtle = YES;
        return YES;
    }
    
    //If they did not touch the turtle have the turtle move to whereever they clicked.
    m_Turtle.moveToPoint = location;
    return YES;
}

- (void) registerWithTouchDispatcher {
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}




-(void)detectCollisions{
    NSMutableArray *removeEnemiesList = [[NSMutableArray alloc]init];
    NSMutableArray *removeBulletsList = [[NSMutableArray alloc]init];
    NSMutableArray *removePowerUpList = [[NSMutableArray alloc]init];
    //Loop through all children of ObstacleLayer
    
    for(CCNode *child in m_PowerUpLayer.children){
        if([child isKindOfClass:[PowerUp class]])
            if(CGRectIntersectsRect([m_Turtle rect], [child rect])){
                NSLog(@"POWER UP");
                
                [removePowerUpList addObject:child];
                [m_Turtle changeShootingPauses:POWERUP_SHOOTING_DECREMENT];
            }
    }
    
    for(CCNode *n in removePowerUpList){
        [m_PowerUpLayer removeChild:n];
    }
    
    
    for (CCNode *child in m_ObstacleLayer.children) {
        //Make sure the child is an Obstacle
        if ( [child isKindOfClass:[Obstacle class] ]) {
            for(TurtleAttack* t in m_TurtleAttackLayer.children){
                if(CGRectIntersectsRect([t rect], [child rect])){
                    [removeEnemiesList addObject:child];
                    [removeBulletsList addObject:t];
                    self.enemiesKilled +=1;
                    NSLog(@"%i, Enemies hit!",self.enemiesKilled);
                    NSUInteger randomIndex = arc4random() % powerUpProbability;

                    if(randomIndex == 0){
                        NSLog(@"Randomly Dropped Item!");
                        [m_PowerUpLayer dropItem:[child rect]];
                        powerUpProbability = POWERUP_CHANCE;
                    }
                    else
                        powerUpProbability--;
                }
            }
            if ( CGRectIntersectsRect([m_Turtle rect], [child rect])) {
                //The turtle got hit!?
                [removeEnemiesList addObject:child];
                m_TurtleLives--;
            }
        }
        //else if object is a Wall
        else if( [child isKindOfClass:[ImoveableObjectObstacle class]] ){
            //Remove the bullet cuz it hit a wall
            for(TurtleAttack* t in m_TurtleAttackLayer.children){
                if(CGRectIntersectsRect([t rect], [child rect])){
                    [removeBulletsList addObject:t];
                }
            }
            //The turtle is dead
            if ( CGRectIntersectsRect([m_Turtle rect], [child rect])) {
                m_TurtleLives = 0;
            }
        }
    }
    
    for(TurtleAttack* att in removeBulletsList){
        [m_TurtleAttackLayer removeChild:att];
    }
    
    
    for(CCNode *remove in removeEnemiesList){
        CCSprite *splode = [CCSprite spriteWithFile:@"splode.png"];
        splode.position = remove.position;
        [self addChild:splode];
        [m_ObstacleLayer removeChild:remove];
        [self performSelector:@selector(removeEnemy:) withObject:splode afterDelay:0.1];
    }
}

-(void)removeEnemy:(CCNode*)splode{
    [self removeChild:splode];
}

-(void)clearChildren{
    //    for (CCNode *child in m_ObstacleLayer.children) {
    //        [self removeChild:child];
    //    }
    //    for( CCNode *attack in m_TurtleAttackLayer.children){
    //        [self removeChild:attack];
    //    }
    //    [self removeChild:m_Turtle];
    gameOver = YES;
    [self removeAllChildrenWithCleanup:YES];
    
    
}


-(void) update:(ccTime)dt {
    if(!gameOver){
        [self detectCollisions];
        [m_BackgroundLayer update:dt];
        [m_Turtle update:dt];
        if(m_Turtle.readyToFire)
            [m_TurtleAttackLayer addAttack:10 start:m_Turtle.position];
        [m_ObstacleLayer update:dt];
        [m_TurtleAttackLayer update:dt];
        [m_PowerUpLayer update:dt];
    }
}

- (void)dealloc
{
    [super dealloc];
}
@end
