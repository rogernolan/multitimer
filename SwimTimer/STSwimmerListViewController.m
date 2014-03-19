//
//  STSwimmerListViewController.m
//  SwimTimer
//
//  Created by Roger Nolan on 18/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerListViewController.h"
#import "STSwimmerStore.h"
#import "STSwimmerDetailController.h"
#import "STSwimmerOverviewCell.h"
#import "STSwimmer.h"

@interface STSwimmerListViewController ()

@property (nonatomic, strong) STSwimmer* createdSwimmer;
@property (nonatomic, strong) NSFetchedResultsController* frc;
@end

@implementation STSwimmerListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSFetchRequest* req = [[NSFetchRequest alloc] initWithEntityName:@"STSwimmer"];
    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES],
                                 [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
    [req setSortDescriptors:sortDescriptors];
    
    self.frc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                    managedObjectContext:[[STSwimmerStore instance] defaultManagedObjectContext]
                                                    sectionNameKeyPath:nil
                                                    cacheName:@"swimmers"];
    
    NSError *error;
    BOOL success = [_frc performFetch:&error];
    self.frc.delegate = self;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller; {
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_frc sections] count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    if ([[_frc sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[_frc sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    } else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    STSwimmerOverviewCell* nameCell = (STSwimmerOverviewCell*)[tableView dequeueReusableCellWithIdentifier:@"SwimmerOverviewCell"];

    STSwimmer* swimmer = (STSwimmer*)[_frc objectAtIndexPath:indexPath];
    [nameCell configureForSwimmer:swimmer];
    return nameCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[_frc sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[_frc sections] objectAtIndex:section];
        return [sectionInfo name];
    } else
        return nil;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"addNewSwimmer"]) {
        self.createdSwimmer = [STSwimmer newSwimmerInDefaultContext];

        [((STSwimmerDetailController*)[segue destinationViewController]) configureForSwimmer:_createdSwimmer];
    } else if ([[segue identifier] isEqualToString:@"editSwimmer"]) {
        STSwimmer* selection = [_frc objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        [((STSwimmerDetailController*)[segue destinationViewController]) configureForSwimmer:selection];

    }
}


- (IBAction)saveFromDetailViewController:(UIStoryboardSegue *)segue {
    [[STSwimmerStore instance] saveDefaultContext];

    
}

- (IBAction)cancelFromDetailViewController:(UIStoryboardSegue *)segue {
    [[[STSwimmerStore instance] defaultManagedObjectContext] deleteObject:_createdSwimmer];

}



@end
