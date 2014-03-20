//
//  STStopWatch.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STStopWatch.h"
#import "STSwimmer.h"

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

- (STTimer*)newTimerNamed:(NSString*)aName{
    STTimer* newTimer = [self newTimer];
    newTimer.name = aName;
    return newTimer;
}

-(void)startAll; {
    NSDate* now = [NSDate date];
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        if(!timer.hasStarted)
            [timer startWithStartTime: now];
    }];
}

- (void)resetAll;{
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        [timer reset];
    }];
}

- (void)stopAll; {
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        [timer stop];
    }];
}

-(BOOL)running; {
    __block BOOL running = NO;
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        if([timer isRunning]){
            running = YES;
            *stop = YES;
        }
        
    }];
    
    return running;
    
}

-(BOOL)hasStarted;{
    __block BOOL started = NO;
    [_timers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STTimer* timer = (STTimer*)obj;
        if([timer hasStarted]){
            started = YES;
            *stop = YES;
        }
        
    }];
    
    return started;
    
}


- (NSUInteger)count {
    return [_timers count];
}

- (STTimer*)timer:(NSInteger)aTimerIndex; {
    return [_timers objectAtIndex:aTimerIndex];
}

+(STStopWatch*)StopWatchWithNames:(NSArray*)swimmers;{
    STStopWatch* newStopwatch = [[STStopWatch alloc] init];
    for(NSString* name in swimmers){
        [newStopwatch newTimerNamed:name];
    }
    
    return newStopwatch;
}

@end
