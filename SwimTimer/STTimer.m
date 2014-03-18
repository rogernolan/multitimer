//
//  STTImer.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STTimer.h"
#import "NSArray+map.h"


@interface STTimer () {

}

@property (strong, nonatomic) NSDate* startTime;                  // Time we were started
@property (strong, nonatomic) NSDate* stopTime;                   // most recent stop time
@property (nonatomic) NSTimeInterval stopTimeReading;     // number of seconds when we were stopped
@property (strong, nonatomic) NSMutableArray* lapTimes;
@property (nonatomic) NSTimeInterval pausedTime;          // How long we have been stopped.

@end

NSString* timeStringFor(NSTimeInterval aNumberOfSeconds){
    
    NSInteger totalSeconds = aNumberOfSeconds;
    NSInteger cents = (100 * aNumberOfSeconds) - (100 * totalSeconds);
    
    NSInteger days = totalSeconds / (60 * 60 * 24);
    totalSeconds -= days * (60 * 60 * 24);
    NSInteger hours = totalSeconds / (60 * 60);
    totalSeconds -= hours * (60 * 60);
    NSInteger minutes = totalSeconds / 60;
    totalSeconds -= minutes * 60;
    
    
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", minutes, totalSeconds, cents];
    
}


@implementation STTimer

-(void)start;{
    if(_stopTime){
        [self willChangeValueForKey:@"running"];
        NSDate* now = [NSDate date];
        _pausedTime += [now timeIntervalSinceDate:_stopTime];
        _stopTime = nil;
        [self didChangeValueForKey:@"running"];
    } else if(!_startTime) {
        [self willChangeValueForKey:@"running"];
        _startTime = [NSDate date];
        [self didChangeValueForKey:@"running"];
        
    }
    
    if(!_lapTimes)
        _lapTimes = [NSMutableArray arrayWithCapacity:4];
    
}

-(void)stop; {
    if(!_stopTime){
        [self willChangeValueForKey:@"running"];
        _stopTime = [NSDate date];
        _stopTimeReading = [self currentRunTime];
        [self didChangeValueForKey:@"running"];
        
    }
}

- (void)startWithStartTime: (NSDate*)aStartTime; {
    [self willChangeValueForKey:@"running"];
    _startTime = aStartTime;
    [self didChangeValueForKey:@"running"];

}

- (void)toggle;{
    if([self isRunning])
        [self stop];
    else
        [self start];
}

- (void)reset; {
    if([self isRunning])
        return;
    [self willChangeValueForKey:@"lapTimes"];
    _lapTimes = [NSMutableArray arrayWithCapacity:4];
    [self didChangeValueForKey:@"lapTimes"];

    _startTime = nil;
    _stopTime = nil;
    _stopTimeReading = 0.0;
    _pausedTime = 0.0;
}


-(void)lap; {
    [self willChangeValueForKey:@"lapTimes"];

    [_lapTimes addObject: @([self currentRunTime])];
    if([_lapTimes count] > 4) {
        [_lapTimes removeObjectAtIndex:0];
    }
    
    [self didChangeValueForKey:@"lapTimes"];

}

-(NSString*)timeString;{
    if(_stopTime) {
        return timeStringFor(_stopTimeReading);
    }
    else
        return timeStringFor([self currentRunTime]);
    
}

-(NSArray*)lapStrings;{
    return [_lapTimes mapObjectsUsingBlock:^id(id obj, NSUInteger idx) {
        return timeStringFor([obj floatValue]);
    }];
}


- (NSTimeInterval) currentRunTime; {
    if(_startTime)
        return [[NSDate date] timeIntervalSinceDate:_startTime] - _pausedTime;
    else
        return 0.0;
}


- (BOOL)isRunning; {
    return _startTime && (_stopTime == nil);
}

-(BOOL)hasStarted;{
    return _startTime ? YES : NO;
}


@end
