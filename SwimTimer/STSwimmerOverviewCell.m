//
//  STSwimmerOverviewCell.m
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerOverviewCell.h"
#import "STSwimmer.h"

@interface STSwimmerOverviewCell ()

@property (nonatomic, strong) STSwimmer* swimmer;

@end

@implementation STSwimmerOverviewCell

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

- (void)prepareForReuse; {
    self.swimmer = nil;
}

-(void)configureForSwimmer:(STSwimmer*)swimmer; {
    self.swimmer = swimmer;
    self.nameLabel.text = [_swimmer fullName];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
