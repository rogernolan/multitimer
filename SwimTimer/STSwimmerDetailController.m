//
//  STNewSwimmerViewController.m
//  SwimTimer
//
//  Created by Roger Nolan on 18/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerDetailController.h"
#import "STSwimmer.h"
#import "STRaceResult.h"
#import "STSwimmerNameCell.h"

@interface STSwimmerDetailController ()
@property (nonatomic, retain) STSwimmer* swimmer;
@property (nonatomic, retain) NSArray* races;
@property (nonatomic, retain) STSwimmerNameCell* firstNameCell;
@property (nonatomic, retain) STSwimmerNameCell* lastNameCell;
@end

@implementation STSwimmerDetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)configureForSwimmer:(STSwimmer*)aSwimmer; {
    self.swimmer = aSwimmer;
    self.races = [aSwimmer.results sortedArrayUsingDescriptors:@[@"date"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender; {
    // Our tabbabr buttons are tag = 1 for done, 2 for cancel.
    if(((UIBarButtonItem*)sender).tag == 1) {
        self.swimmer.firstName = _firstNameCell.nameEdit.text;
        self.swimmer.lastName = _lastNameCell.nameEdit.text;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if([_races count] > 0)
        return 2;
    else
        return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return NSLocalizedString(@"Details", @"Personal details header in details view");
            break;
        case 1:
            return NSLocalizedString(@"Races", @"Results header in details view");
        default:
            return 0;
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return [_races count];
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch ([indexPath section]) {
        case 0:
            return 70.0f;
            break;
        default:
            return 50.0f;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell;
    switch ([indexPath section]) {
        case 0:{         // Swimmer details
            switch ([indexPath row]) {
                case 0:
                    if(_firstNameCell) {
                        return _firstNameCell;
                    } else {
                        self.firstNameCell = (STSwimmerNameCell*)[tableView dequeueReusableCellWithIdentifier:@"swimmerNameCell"];
                        [_firstNameCell setFirstName:_swimmer.firstName];
                        return _firstNameCell;
                    }
                    
                    break;
                case 1:
                    if(_lastNameCell) {
                        return _lastNameCell;
                    } else {
                        self.lastNameCell = (STSwimmerNameCell*)[tableView dequeueReusableCellWithIdentifier:@"swimmerNameCell"];
                        [_lastNameCell setLastName:_swimmer.firstName];
                    }
                    return _lastNameCell;
                default:
                    break;
            }
        }
            break;
        case 1:           // race results.
            ;
        default:
            break;
    }
    
    return cell;
}

@end
