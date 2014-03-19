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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"details", @"results"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell;
    switch ([indexPath section]) {
        case 0:
            ;
            STSwimmerNameCell* nameCell = (STSwimmerNameCell*)[tableView dequeueReusableCellWithIdentifier:@"swimmerNameCell"];
            switch ([indexPath row]) {
                case 0:
                    [nameCell setFirstName:_swimmer.firstName];
                    break;
                case 1:
                    [nameCell setSecondName:_swimmer.lastName];

                default:
                    break;
            }
            break;
        case 1:
        default:
            break;
    }
}



@end
