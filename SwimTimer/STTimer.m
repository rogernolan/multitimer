//
//  STTImer.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STTimer.h"

@interface STTimer () {

}

@property (strong, nonatomic) NSDate* startTime;                  // Time we were started
@property (strong, nonatomic) NSDate* stopTime;                   // most recent stop time
@property (nonatomic) NSTimeInterval stopTimeReading;     // number of seconds when we were stopped
@property (nonatomic) NSTimeInterval lapTime;
@property (nonatomic) NSTimeInterval pausedTime;          // How long we have been stopped.

@end

@implementation STTimer

- (void)reset; {
    _startTime = nil;
    _stopTime = nil;
    _stopTimeReading = 0.0;
    _pausedTime = 0.0;
    _lapTime = 0;
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
}

-(void)stop; {
    if(!_stopTime){
        _stopTime = [NSDate date];
        _stopTimeReading = [self currentRunTime];
    }
}

-(void)lap; {
    _lapTime = [self currentRunTime];
}

-(NSString*)timeString;{
    if(_stopTime) {
        return [self timeStringFor:_stopTimeReading];
    }
    else
        return [self timeStringFor:[self currentRunTime]];
    
}

-(NSString*)lapString;{
    return [self timeStringFor:_lapTime];
}


- (NSTimeInterval) currentRunTime; {
    return [[NSDate date] timeIntervalSinceDate:_startTime] - _pausedTime;
}

- (NSString*)timeStringFor:(NSTimeInterval) aNumberOfSeconds{
    
    NSInteger totalSeconds = aNumberOfSeconds;
    NSInteger cents = (100 * aNumberOfSeconds) - (100 * totalSeconds);
    
    NSInteger days = totalSeconds / (60 * 60 * 24);
    totalSeconds -= days * (60 * 60 * 24);
    NSInteger hours = totalSeconds / (60 * 60);
    totalSeconds -= hours * (60 * 60);
    NSInteger minutes = totalSeconds / 60;
    totalSeconds -= minutes * 60;


    return [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", hours, minutes, totalSeconds, cents];
    
}

- (BOOL)isRunning; {
    return _startTime && (_stopTime == nil);
}
@end
