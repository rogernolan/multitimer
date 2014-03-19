//
//  STNewSwimmerViewController.h
//  SwimTimer
//
//  Created by Roger Nolan on 18/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STSwimmer;

@interface STSwimmerDetailController : UITableViewController
- (void)configureForSwimmer:(STSwimmer*)aSwimmer;

@end
