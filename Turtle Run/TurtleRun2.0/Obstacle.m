//
//  Obstacle.m
//  Turtle Run
//
//  Created by Kyle on 2/19/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "Obstacle.h"
//static int obstacleSpeed = 100;

@implementation Obstacle {
    
}

@synthesize hp;

//+ (int) speed {return obstacleSpeed;}

- (id)init
{
    self = [super initWithFile:@"clawg_64x64.png"];
    
    if (self) {
        hp = 100;
        int cols = 4;
        int col = arc4random_uniform(cols);
        texSplode = [[CCTextureCache sharedTextureCache] addImage:@"splode.png"];
        CGSize size = [[CCDirector sharedDirector] winSize];
        self.position = ccp(

                            
                            (((col + 1) * size.width)/(cols+1)), size.height+100
                            );
        obstacleSpeed = 100;
        //CCMoveTo *moveAction = [CCMoveTo actionWithDuration:5.0 position:ccp(self.position.x, -100)];
        //[self runAction:moveAction];
        [self scheduleUpdate];
    }
   
    return self;
}

-(void)setType:(int)typeValue level:(int)lvl{
    int temp = arc4random()%2;
    if(typeValue == 1){
            leftToRightVelocity = YES;
            self.diagonalType = NO;
    }
    else if(typeValue == 2){
        if (temp)
            leftToRightVelocity = YES;
        else
            leftToRightVelocity = NO;
            self.diagonalType = YES;
    }
    else if(typeValue == 3){
        obstacleSpeed+=(lvl*15);
        leftToRightVelocity = YES;
        self.diagonalType = NO;

    }
    else if(typeValue == 4){
        obstacleSpeed=(lvl*20);
        if (temp)
            leftToRightVelocity = YES;
        else
            leftToRightVelocity = NO;
        self.diagonalType = YES;
    }

    
}

//basic southward movement shared by all Obstacles
-(void)  travel:(ccTime)dt {
//     NSLog(diagonalType ? @"Yes" : @"No");
    CGSize size = [[CCDirector sharedDirector] winSize];
    if(!self.diagonalType){
        self.position = ccpAdd(self.position, CGPointMake(0,-obstacleSpeed * dt));
    }
    else{
        if(leftToRightVelocity)
            self.position = ccpAdd(self.position, CGPointMake((int)(obstacleSpeed * dt),-obstacleSpeed * dt));
        else
            self.position = ccpAdd(self.position, CGPointMake((int)(-obstacleSpeed * dt),-obstacleSpeed * dt));
        
        //Check for bouncing against walls.
        if(obstacleSpeed >0){
            if(self.position.x + self.contentSize.width/2>size.width){
                self.position = ccp(size.width - self.contentSize.width/2, self.position.y);
                leftToRightVelocity = NO;
            }
            else if(self.position.x - self.contentSize.width/2<0){
                self.position = ccp(0 + self.contentSize.width/2, self.position.y);
                leftToRightVelocity = YES;
            }
        }
    }
    
}

-(void)setSpeed:(int)spd{
    obstacleSpeed = spd;
}

-(void) update:(ccTime)dt {
    [self travel:dt];
}

-(void) hit:(int)damage {
    hp -= damage;
    if (hp <= 0) {
        [self splode];
    }
}

-(bool) dies {
    if (hp <= 0) {
        [self splode];
        return true;}
    
    return false;
}

-(void) splode {
    obstacleSpeed = 100;
    [self addChild:[CCSprite spriteWithTexture:texSplode]];
}


-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}

-(BOOL)contains:(CGPoint)pt{
    return CGRectContainsPoint([self rect], pt);
}


@end