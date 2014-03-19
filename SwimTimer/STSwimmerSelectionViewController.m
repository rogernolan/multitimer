//
//  STSwimmerSelectionViewController.m
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerSelectionViewController.h"
#import "STSwimmerStore.h"
#import "STSwimmer.h"
#import "STSwimmerSelectionCell.h"

@interface STSwimmerSelectionViewController ()

@property (strong, nonatomic) NSFetchedResultsController* frc;
@end

@implementation STSwimmerSelectionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
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


- (void)didReceiveMemoryWarning{
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
    STSwimmerSelectionCell* nameCell = (STSwimmerSelectionCell*)[tableView dequeueReusableCellWithIdentifier:@"SwimmerSelectionCell"];
    
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


@end
