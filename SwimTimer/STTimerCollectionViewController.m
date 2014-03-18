//
//  STTimerCollectionViewController.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STTimerCollectionViewController.h"
#import "STTimerCell.h"
#import "STTimerHeader.h"
#import "STStopWatch.h"

@interface STTimerCollectionViewController ()

@end

@implementation STTimerCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.allowsSelection = YES;

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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section; {
    if(section == 0) {
        return 6;
    }
    
    return 0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;{
    
    STTimerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"STTimerCell" forIndexPath:indexPath];
    STTimer* newTimer = [[STStopWatch instance] newTimer];
    [cell configureWithTimer:newTimer];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath; {
    STTimerHeader* cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"STTimerHeader" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(collectionView.frame.size.width, 68.0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0.0, 0.0);
}

#pragma mark cell actions

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [[[STStopWatch instance] timer:[indexPath row]] lap];
    return NO;
}

#pragma mark actions from Storboard

- (IBAction)startAllPressed:(id)sender;{
    [[STStopWatch instance] startAll];
}

- (IBAction)resetAllPressed:(id)sender;{
    [[STStopWatch instance] resetAll];

}

@end
