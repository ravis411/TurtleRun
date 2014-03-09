//
//  Obstacle.h
//  Turtle Run
//


#import "CCSprite.h"
#import "cocos2d.h"
#import "ObstacleBaseClass.h"

@interface ImoveableObjectObstacle : ObstacleBaseClass {
    CCTexture2D *texSplode;
}

@property int hp;

+ (int) speed;
-(void) hit:(int)damage;
-(bool) dies;
-(void) splode;
-(id) init;
-(void) travel:(ccTime)dt;
-(void) update:(ccTime)dt;
-(void) dealloc;
-(CGRect) rect;
-(BOOL) contains:(CGPoint)pt;//returns true if the point is within the obstacle

@end
