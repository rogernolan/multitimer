//
//  STSwimmerNameCell.m
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerNameCell.h"

@implementation STSwimmerNameCell

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


-(void)setFristName:(NSString*)aName;{
    _nameTypeLabel.text = NSLocalizedString(@"First name label", @"First name");
    aName;
    
}

-(void)setLastName:(NSString*)aName;{
    
}

@end
