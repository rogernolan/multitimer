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

- (void) configure; {
    _myTimer = [[STStopWatch instance] newTimer];
    [_lapButton setTitle:NSLocalizedString(@"Lap", @"Lap button") forState:UIControlStateNormal];
    [_startStopButton setTitle:NSLocalizedString(@"Start", @"Start timer") forState:UIControlStateNormal];
}

-(void)updateTick:(NSTimer*)aTimer; {
    _timerLabel.text = [_myTimer timeString];
    NSArray* labels = _lapLabels;
    [[_myTimer lapStrings] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ((UILabel*)labels[idx]).text = obj;
    }];
}

-(void)stopUpdatingUI; {
    [_updateTimer invalidate];
    _updateTimer = nil;
}

-(void)startUpdatingUI;{
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTick:) userInfo:nil repeats:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)startStopPressed:(id)sender {
    
    if([_myTimer isRunning]) {
        [_myTimer stop];
        [self stopUpdatingUI];
        [_startStopButton setTitle:NSLocalizedString(@"Start", @"Start timer button") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Reset", @"Reset timer button") forState:UIControlStateNormal];
    } else {
        [_myTimer start];
        [self startUpdatingUI];
        [_startStopButton setTitle:NSLocalizedString(@"Stop", @"Start timer button") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Lap", @"Lap button") forState:UIControlStateNormal];

    }
}

- (IBAction)lapPressed:(id)sender {
    if([_myTimer isRunning]) {
        [_myTimer lap];
    } else {
        [_myTimer reset];
        [_startStopButton setTitle:NSLocalizedString(@"Start", @"Start timer") forState:UIControlStateNormal];
        [_lapButton setTitle:NSLocalizedString(@"Lap", @"Lap button") forState:UIControlStateNormal];
        _timerLabel.text = @"00:00:00";
        [_lapLabels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ((UILabel*) obj).text = @"00:00:00";

        }];
    }
}

@end
