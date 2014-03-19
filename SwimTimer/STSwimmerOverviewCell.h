//
//  STSwimmerOverviewCell.h
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STSwimmer;

@interface STSwimmerOverviewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

-(void)configureForSwimmer:(STSwimmer*)swimmer;

@end
