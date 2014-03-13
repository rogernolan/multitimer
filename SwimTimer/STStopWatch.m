//
//  STStopWatch.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STStopWatch.h"

@interface STStopWatch () {
}

@property (strong, nonatomic)     NSMutableArray* timers;


@end

@implementation STStopWatch


-(STStopWatch*)init;{
    self = [super init];
    if(self) {
        _timers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(STTimer*)newTimer; {
    STTimer* newTimer = [[STTimer alloc] init];
    [_timers addObject:newTimer];
    
    return newTimer;
}

-(void)startAll; {
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        [timer start];
    }];
}

- (void)stopAll; {
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        [timer stop];
    }];
}

@end
