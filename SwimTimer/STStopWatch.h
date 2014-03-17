//
//  STStopWatch.h
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLSingleton.h"
#import "STTimer.h"

@interface STStopWatch : KLSingleton

- (STTimer*)newTimer;
- (void)startAll;
- (void)resetAll;
- (void)stopAll;
- (STTimer*)timer:(NSInteger)aTimerIndex;

@end
