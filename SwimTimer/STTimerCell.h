//
//  STTimerCell.h
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STTimerCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *lapLabel;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *lapButton;

- (void) configure;

    
- (IBAction)startStopPressed:(id)sender;
- (IBAction)lapPressed:(id)sender;

@end
