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

- (void)prepareForReuse; {
    _myTimer = nil;
    [self stopLiveUpdatingTime];
    
}

- (void) configureWithTimer:(STTimer*)aTimer; {
    
    if(_myTimer) {
        [_myTimer removeObserver:self forKeyPath:@"running"];
    }
    _myTimer =  aTimer;

    [_myTimer addObserver:self forKeyPath:@"running" options:NSKeyValueObservingOptionNew context:nil];

    [self updateUserInterface];
    
    _startStopButton.layer.cornerRadius = _startStopButton.bounds.size.width/2.0;
    _startStopButton.layer.borderWidth = 1.0;
    _startStopButton.layer.borderColor = _lapButton.titleLabel.textColor.CGColor;
    
    _lapButton.layer.cornerRadius = _lapButton.bounds.size.width/2.0;
    _lapButton.layer.borderWidth = 1.0;
    _lapButton.layer.borderColor = _lapButton.titleLabel.textColor.CGColor;
}

-(void)updateTick:(NSTimer*)aTimer; {
    _timerLabel.text = [_myTimer timeString];
    NSArray* labels = _lapLabels;
    [[_myTimer lapStrings] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ((UILabel*)labels[idx]).text = obj;
    }];
}

#pragma mark UI management
-(void)updateUserInterface; {
    if([_myTimer isRunning]) {
        [_startStopButton setTitle:NSLocalizedString(@"Stop", @"Start timer button") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Lap", @"Lap button") forState:UIControlStateNormal];
        [self startLiveUpdatingTime];
     } else {
        [_startStopButton setTitle:NSLocalizedString(@"Start", @"Start timer button") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Reset", @"Reset timer button") forState:UIControlStateNormal];
        [self stopLiveUpdatingTime];
    }
}

-(void)stopLiveUpdatingTime; {
    [_updateTimer invalidate];
    _updateTimer = nil;
}

-(void)startLiveUpdatingTime;{
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTick:) userInfo:nil repeats:YES];
}

#pragma mark KVO on the timer.

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(_myTimer.isRunning) {
        [self startLiveUpdatingTime];
    } else {
        [self stopLiveUpdatingTime];
    }
    
    [self updateUserInterface];
}

#pragma mark Actions from the storyboard.

- (IBAction)startStopPressed:(id)sender {
    
    if([_myTimer isRunning]) {
        [_myTimer stop];
        [self stopLiveUpdatingTime];

    } else {
        [_myTimer start];
        [self startLiveUpdatingTime];

    }
    
    [self updateUserInterface];
}

- (IBAction)lapPressed:(id)sender {
    if([_myTimer isRunning]) {
        [_myTimer lap];
    } else {
        [_myTimer reset];
        [self updateUserInterface];
        _timerLabel.text = @"00:00:00";
        [_lapLabels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ((UILabel*) obj).text = @"00:00:00";

        }];
    }
}

@end
