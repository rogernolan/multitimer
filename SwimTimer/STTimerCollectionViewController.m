//
//  STTimerCollectionViewController.m
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STTimerCollectionViewController.h"
#import "STTimerCell.h"
#import "STStopWatch.h"

@interface STTimerCollectionViewController ()
@property (nonatomic, strong) STStopWatch* stopwatch;
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

- (void)viewWillAppear:(BOOL)animated {
    if(!_stopwatch) {
        NSMutableArray* names = [NSMutableArray arrayWithCapacity:6];
        NSString* formatString = NSLocalizedString(@"Timer %d", @"format string for generic timer names");
        for(int i= 1 ; i <=6 ; i++) {
            [names addObject:[NSString stringWithFormat:formatString, i]];
        }
        self.stopwatch = [STStopWatch StopWatchWithNames:names];
    }
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


-(void) configureWithStopWatch:(STStopWatch*)aStopwatch;{
    self.stopwatch = aStopwatch;
}

#pragma mark - Navigation
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//
// 
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section; {
    if(section == 0) {
        return (NSInteger)[_stopwatch count];
    }
    
    return 0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;{
    
    STTimerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"STTimerCell" forIndexPath:indexPath];
    [cell configureWithTimer:[_stopwatch timer:[indexPath row]]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath; {
    UICollectionReusableView* cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"STTimerFooter" forIndexPath:indexPath];
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(collectionView.frame.size.width, 68.0);

}

#pragma mark cell actions


#pragma mark actions from Storboard

- (IBAction)startAllPressed:(id)sender;{
    [_stopwatch  startAll];
}

- (IBAction)resetAllPressed:(id)sender;{
    [_stopwatch resetAll];

}

@end
