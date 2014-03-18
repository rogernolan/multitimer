//
//  STTimerCell.h
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STTimer;

@interface STTimerCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lapLabels;


@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *lapButton;

- (void) configureWithTimer:(STTimer*)aTimer;

    
- (IBAction)startStopPressed:(id)sender;
- (IBAction)lapPressed:(id)sender;

@end
