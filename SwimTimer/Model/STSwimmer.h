#import "_STSwimmer.h"

@interface STSwimmer : _STSwimmer {}
- (NSString*)fullName;

+(STSwimmer*)newSwimmerCalled:(NSString*)firstName lastName:(NSString*)lastName inContext:(NSManagedObjectContext*)context;
+(STSwimmer*)newSwimmerInDefaultContext;

-(STRaceResult*)addRaceResult:(NSString*)stroke withDistance:(NSInteger)distance finishTime:(NSTimeInterval)time;

@end
