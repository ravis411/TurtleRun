//
//  LeaderBoardController.h
//  TurtleRun2.0
//
//  Created by Eric Liu on 3/9/14.
//  Copyright (c) 2014 TeamTurtleRun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface LeaderBoardController : NSObject
{
    NSString *userName;
    int score;
}

@property (copy,nonatomic) NSString *userName;
@property (retain, nonatomic) int score;

@end
