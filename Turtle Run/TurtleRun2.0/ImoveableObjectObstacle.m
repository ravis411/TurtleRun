
//

#import "ImoveableObjectObstacle.h"
static int obstacleSpeed = 10;

@implementation ImoveableObjectObstacle {
    
}

@synthesize hp;

+ (int) speed {return obstacleSpeed;}

- (id)init
{
    CGRect rect= CGRectMake(0, 0, 75, 25);
    self = [super initWithFile:@"tile.png" rect:rect];
    
    if (self) {
        hp = 100;
        int cols = 4;
        int col = arc4random_uniform(cols);
        texSplode = [[CCTextureCache sharedTextureCache] addImage:@"splode.png"];
        CGSize size = [[CCDirector sharedDirector] winSize];
        //[self setScale:.07];
        self.position = ccp(
                            (((col + 1) * size.width)/(cols+1)), size.height-50
                            );
        //CCMoveTo *moveAction = [CCMoveTo actionWithDuration:5.0 position:ccp(self.position.x, -100)];
        //[self runAction:moveAction];
        [self scheduleUpdate];
    }
    return self;
}

//basic southward movement shared by all Obstacles
-(void) travel {
    self.position = ccpAdd(self.position, CGPointMake(0,-2));
}

-(void) update:(ccTime)dt {
    [self travel];
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
        return true;
    }
    
    return false;
}

-(void) splode {
    [self addChild:[CCSprite spriteWithTexture:texSplode]];
}



-(BOOL)contains:(CGPoint)pt{
    return CGRectContainsPoint([self rect], pt);
}


@end