//
//  STSwimmerStore.m
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import "STSwimmerStore.h"
#import "STAppDelegate.h"
#import "STSwimmer.h"
#import "STRaceResult.h"

@implementation STSwimmerStore

@synthesize defaultManagedObjectContext = _defaultManagedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - Core Data stack

- (NSManagedObjectContext *)defaultManagedObjectContext
{
    if (_defaultManagedObjectContext != nil) {
        return _defaultManagedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _defaultManagedObjectContext = [[NSManagedObjectContext alloc] init];
        [_defaultManagedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _defaultManagedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Swimmers" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[[STAppDelegate  stDelegate] applicationDocumentsDirectory] URLByAppendingPathComponent:@"test.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
#pragma warning "Not handling core data errors"

        NSLog(@"Error loading core data storecoordinator %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (void)saveDefaultContext; {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.defaultManagedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
#pragma warning "Not handling core data errors"
            NSLog(@"UError persisting core data %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
@end
