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
@property (nonatomic) NSMutableArray* lapTimes;
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

- (void)reset; {
    _lapTimes = [NSMutableArray arrayWithCapacity:4];
    _startTime = nil;
    _stopTime = nil;
    _stopTimeReading = 0.0;
    _pausedTime = 0.0;
}

-(void)start;{
    if(_stopTime){
        NSDate* now = [NSDate date];
        _pausedTime += [now timeIntervalSinceDate:_stopTime];
        _stopTime = nil;
    }
    
    if(!_startTime) {
        _startTime = [NSDate date];
    }
    
    if(!_lapTimes)
        _lapTimes = [NSMutableArray arrayWithCapacity:4];

}

-(void)stop; {
    if(!_stopTime){
        _stopTime = [NSDate date];
        _stopTimeReading = [self currentRunTime];
    }
}

-(void)lap; {
    [_lapTimes addObject: @([self currentRunTime])];
    if([_lapTimes count] > 4) {
        [_lapTimes removeObjectAtIndex:0];
    }
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
    return [[NSDate date] timeIntervalSinceDate:_startTime] - _pausedTime;
}



- (BOOL)isRunning; {
    return _startTime && (_stopTime == nil);
}
@end
