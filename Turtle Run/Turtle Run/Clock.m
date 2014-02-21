//
//  Clock.m
//  Turtle Run
//
//  Created by Kyle on 2/19/14.
//  Copyright (c) 2014 USC. All rights reserved.
//

#import "Clock.h"

@implementation Clock

@synthesize speed;

- (id)init {
    self = [super init];
    if (self) {
        speed = 50;
    }
    return self;
}

@end
