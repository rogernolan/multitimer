//
//  STRaceResultsCell.m
//  SwimTimer
//
//  Created by Roger Nolan on 20/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STRaceResultsCell.h"
#import "STRaceResult.h"
#import "STTimer.h"     // for timeStringFor

@implementation STRaceResultsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureWithRaceResult:(STRaceResult*)aResult; {
    _dateLabel.text = [NSDateFormatter localizedStringFromDate:aResult.date dateStyle:kCFDateFormatterShortStyle timeStyle:kCFDateFormatterNoStyle];
    _titleLabel.text = [NSString stringWithFormat: @"%@m %@", aResult.distance, aResult.stroke];
    _timeLabel.text = timeStringFor([aResult.time floatValue]);
    
}

@end
