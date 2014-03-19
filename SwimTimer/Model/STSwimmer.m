#import "STSwimmer.h"
#import "STSwimmerStore.h"
#import "STRaceResult.h"

@interface STSwimmer ()

// Private interface goes here.

@end


@implementation STSwimmer


-(STRaceResult*)addRaceResult:(NSString*)stroke withDistance:(NSInteger)distance finishTime:(NSTimeInterval)time;{
    NSManagedObjectContext* ctx = self.managedObjectContext;
    
    STRaceResult* result = [STRaceResult insertInManagedObjectContext:ctx];
    result.stroke = stroke;
    result.distance = @(distance);
    result.date = [NSDate date];
    result.time = @(time);
    
    [self addResultsObject:result];
    
    return result;

}

+(STSwimmer*)newSwimmerCalled:(NSString*)firstName lastName:(NSString*)lastName inContext:(NSManagedObjectContext*)context; {
    STSwimmer* swimmer = [self insertInManagedObjectContext:context];
    swimmer.firstName = firstName;
    swimmer.lastName = lastName;
    
    return swimmer;
}

+(STSwimmer*)newSwimmerInDefaultContext; {
    return [self newSwimmerCalled:nil lastName:nil inContext:[[STSwimmerStore instance] defaultManagedObjectContext]];
}
@end
