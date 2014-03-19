#import "_STSwimmer.h"

@interface STSwimmer : _STSwimmer {}

+(STSwimmer*)newSwimmerCalled:(NSString*)firstName lastName:(NSString*)lastName inContext:(NSManagedObjectContext*)context;
+(STSwimmer*)newSwimmerInDefaultContext;
@end
