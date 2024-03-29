//
//  SpriteLayer.m
//  Turtle Run
//
//  Created by Kyle on 2/18/14.
//  Copyright (c) 2014 USC. All rights reserved.
//
#define POWERUP_SHOOTING_DECREMENT -4
#define POWERUP_CHANCE 35
#import "SpriteLayer.h"
//#import "Obstacle.h"//need this to check for colisions
//Test Andrew3.0

@implementation SpriteLayer

@synthesize turtleLives = m_TurtleLives;

- (id)init
{
    self = [super init];
    if (self) {
        self.totalScore = 0;
        self.enemiesKilled = 0;
        self.totalEnemiesKilled = 0;
        //        CGSize size = [[CCDirector sharedDirector] winSize];
        powerUpProbability = POWERUP_CHANCE;
        currentLevel = 1;
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
    CCNode *hitTurtle = nil;
    //Loop through all children of ObstacleLayer
    
    for(PowerUp *child in m_PowerUpLayer.children){
        if([child isKindOfClass:[PowerUp class]])
            if(CGRectIntersectsRect([m_Turtle rect], [child rect])){
                NSLog(@"POWER UP");
                
                [removePowerUpList addObject:child];
                NSLog(@"Got the powerup value: %d", [child getPowerUpType]);
                switch ([child getPowerUpType]) {
                    case 0:
                        [m_Turtle incrementCannonCount:1];
                        [m_Turtle changeShootingPauses:(3)];
                        break;
                    case 1:
                        [m_Turtle changeShootingPauses:POWERUP_SHOOTING_DECREMENT];
                        break;
                    case 2:
                        m_TurtleLives++;
                        break;
                    case 3:
                        [m_Turtle changeShootingPauses:POWERUP_SHOOTING_DECREMENT];
                        break;
                        
                    default:
                        break;
                }
                
            }
    }
    
    for(CCNode *n in removePowerUpList){
        [m_PowerUpLayer removeChild:n];
    }
    
    
    for (CCNode *child in m_ObstacleLayer.children) {
        //Make sure the child is an Obstacle
        if ( [child isKindOfClass:[Obstacle class] ]) {
            for(TurtleAttack* t in m_TurtleAttackLayer.children){
                if(CGRectIntersectsRect([t rect], [child rect]) && ![removeEnemiesList containsObject:child]){
                    [removeEnemiesList addObject:child];
                    [removeBulletsList addObject:t];
                    self.enemiesKilled +=1;
                    self.totalEnemiesKilled++;
//                    NSLog(@"%i, Enemies hit!",self.enemiesKilled);
                    NSUInteger randomIndex = arc4random() % powerUpProbability;
                    if(randomIndex == 0){
                        NSLog(@"Randomly Dropped Item!");
                        [m_PowerUpLayer dropItem:[child rect]];
                        powerUpProbability = POWERUP_CHANCE+(currentLevel*10);
                    }
                    else
                        powerUpProbability--;
                }
            }
            if ( CGRectIntersectsRect([m_Turtle rect], [child rect])) {
                if(![removeEnemiesList containsObject:child]){
                    
                    hitTurtle = child;
                    m_TurtleLives--;
                    //The turtle got hit!?
                }
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
    if(hitTurtle != nil){
        [m_ObstacleLayer removeChild:hitTurtle];
        CCSprite *xplode = [CCSprite spriteWithFile:@"splode.png"];
        xplode.position = hitTurtle.position;
        [self addChild:xplode];
         [self performSelector:@selector(removeEnemy:) withObject:xplode afterDelay:0.1];
        hitTurtle = nil;
        
    }
   
    
    for(CCNode *remove in removeEnemiesList){
        CCSprite *splode = [CCSprite spriteWithFile:@"splode.png"];
        splode.position = remove.position;
        [self addChild:splode];
        //        [m_ObstacleLayer removeChild:remove];
        [m_ObstacleLayer destroyTarget:remove];
        [self performSelector:@selector(removeEnemy:) withObject:splode afterDelay:0.1];
    }
    
    for(TurtleAttack* att in removeBulletsList){
        [m_TurtleAttackLayer removeChild:att];
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
    currentLevel = 1;
    gameOver = YES;
    [self removeAllChildrenWithCleanup:YES];
    
    
}
-(void)setLevel:(int)lvl{
    currentLevel = lvl;
    [m_BackgroundLayer changeBackground:lvl];
}




-(void) update:(ccTime)dt {
    if(!gameOver){
        self.totalScore = (int)[m_BackgroundLayer getDistancetraveled]+(self.totalEnemiesKilled*4);
        [self detectCollisions];
        [m_BackgroundLayer update:dt];
        [m_Turtle update:dt];
        if(m_Turtle.readyToFire){
            for(int i=1;i<=[m_Turtle getCannonCount];i++){
                int temp = 100 - i*(200/([m_Turtle getCannonCount]+1));
                [m_TurtleAttackLayer addAttack:10 start:m_Turtle.position degree:temp];

            }
        }
//        [m_ObstacleLayer update:dt];
        [m_ObstacleLayer update:dt level:currentLevel];
        [m_TurtleAttackLayer update:dt];
        [m_PowerUpLayer update:dt];
    }
}


-(void)level:(int)level{
    
}


- (void)dealloc
{
    [super dealloc];
}
@end
