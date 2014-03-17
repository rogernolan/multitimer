//
//  STTimerCell.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STTimerCell.h"
#import "STStopWatch.h"

@interface STTimerCell () {
}
@property (strong, nonatomic) STTimer* myTimer;
@property (strong, nonatomic) NSTimer* updateTimer;


@end

@implementation STTimerCell

- (void) setTimer:(STTimer*)aTimer; {
    
    if(_myTimer) {
        [_myTimer removeObserver:self forKeyPath:@"running"];
    }
    _myTimer =  aTimer;

    [_myTimer addObserver:self forKeyPath:@"running" options:NSKeyValueObservingOptionNew context:nil];

    [self updateButtonText];
}

-(void)updateTick:(NSTimer*)aTimer; {
    _timerLabel.text = [_myTimer timeString];
    NSArray* labels = _lapLabels;
    [[_myTimer lapStrings] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ((UILabel*)labels[idx]).text = obj;
    }];
}

#pragma mark UI management
-(void)updateButtonText; {
    if([_myTimer isRunning]) {
        [_startStopButton setTitle:NSLocalizedString(@"Start", @"Start timer button") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Reset", @"Reset timer button") forState:UIControlStateNormal];
    } else {
        [_startStopButton setTitle:NSLocalizedString(@"Stop", @"Start timer button") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Lap", @"Lap button") forState:UIControlStateNormal];
        
    }
}

-(void)stopUpdatingUI; {
    [_updateTimer invalidate];
    _updateTimer = nil;
}

-(void)startUpdatingUI;{
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTick:) userInfo:nil repeats:YES];
}

#pragma mark KVO on the timer.

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(_myTimer.isRunning) {
        [self startUpdatingUI];
    } else {
        [self stopUpdatingUI];
    }
    
    [self updateButtonText];
}

#pragma mark Actions from the storyboard.

- (IBAction)startStopPressed:(id)sender {
    
    if([_myTimer isRunning]) {
        [_myTimer stop];
        [self stopUpdatingUI];

    } else {
        [_myTimer start];
        [self startUpdatingUI];

    }
    
    [self updateButtonText];
}

- (IBAction)lapPressed:(id)sender {
    if([_myTimer isRunning]) {
        [_myTimer lap];
    } else {
        [_myTimer reset];
        [self updateButtonText];
        _timerLabel.text = @"00:00:00";
        [_lapLabels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ((UILabel*) obj).text = @"00:00:00";

        }];
    }
}

@end
