//
//  STSwimmerStore.h
//  SwimTimer
//
//  Created by Roger Nolan on 19/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLSingleton.h"

@interface STSwimmerStore : KLSingleton

@property (readonly, strong, nonatomic) NSManagedObjectContext *defaultManagedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveDefaultContext;

@end
