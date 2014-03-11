
//

#import "ImoveableObjectObstacle.h"
static int obstacleSpeed = 10;

@implementation ImoveableObjectObstacle {
    
}

@synthesize hp;

+ (int) speed {return obstacleSpeed;}

- (id)init
{
//    CGRect rect= CGRectMake(0, 0, 75, 25);
//    self = [super initWithFile:@"wall.png" rect:rect];
    self = [super initWithFile:@"wall.png"];
    if (self) {
        hp = 100;
        int cols = 4;
        int col = arc4random_uniform(cols);
        texSplode = [[CCTextureCache sharedTextureCache] addImage:@"splode.png"];
        CGSize size = [[CCDirector sharedDirector] winSize];
        //[self setScale:.07];
        self.position = ccp( ( ((col + 1)*size.width) / (cols+1) ), size.height+50 );

        [self scheduleUpdate];
    }
    return self;
}



-(void) update:(ccTime)dt {
    self.position = ccpAdd(self.position, CGPointMake(0, (int)(-100*dt)) );
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

-(CGRect)rect{
    return CGRectMake(self.position.x - self.contentSize.width * self.anchorPoint.x,
                      self.position.y - self.contentSize.height * self.anchorPoint.y, self.contentSize.width, self.contentSize.height);
}


-(BOOL)contains:(CGPoint)pt{
    return CGRectContainsPoint([self rect], pt);
}


@end