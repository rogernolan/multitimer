//
//  STSwimmerSelectionCell.m
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerSelectionCell.h"
#import "STSwimmer.h"

@interface STSwimmerSelectionCell ()

@property (nonatomic, strong) STSwimmer* swimmer;

@end

@implementation STSwimmerSelectionCell

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
    [self setAccessoryType:UITableViewCellAccessoryNone];
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
