//
//  STSwimmerNameCell.h
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STSwimmerNameCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameEdit;

-(void)setFirstName:(NSString*)aName;
-(void)setLastName:(NSString*)aName;

@end
