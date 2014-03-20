//
//  STRaceResultsCell.h
//  SwimTimer
//
//  Created by Roger Nolan on 20/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STRaceResult;

@interface STRaceResultsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

-(void)configureWithRaceResult:(STRaceResult*)aResult;

@end
