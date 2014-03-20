//
//  STTimerCollectionViewController.h
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STStopWatch;


@interface STTimerCollectionViewController : UICollectionViewController


- (IBAction)startAllPressed:(id)sender;
- (IBAction)resetAllPressed:(id)sender;

-(void) configureWithStopWatch:(STStopWatch*)aStopwatch;

@end
