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


-(void)setFirstName:(NSString*)aName;{
    _nameTypeLabel.text = NSLocalizedString(@"First name", @"First name label");
    _nameEdit.text = aName;
    
}

-(void)setLastName:(NSString*)aName;{
    _nameTypeLabel.text = NSLocalizedString(@"Last name", @"Last name label");
    _nameEdit.text = aName;
}

@end
