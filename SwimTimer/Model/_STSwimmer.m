// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to STSwimmer.m instead.

#import "_STSwimmer.h"

const struct STSwimmerAttributes STSwimmerAttributes = {
	.firstName = @"firstName",
	.lastName = @"lastName",
};

const struct STSwimmerRelationships STSwimmerRelationships = {
	.results = @"results",
};

const struct STSwimmerFetchedProperties STSwimmerFetchedProperties = {
};

@implementation STSwimmerID
@end

@implementation _STSwimmer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"STSwimmer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"STSwimmer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"STSwimmer" inManagedObjectContext:moc_];
}

- (STSwimmerID*)objectID {
	return (STSwimmerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic firstName;






@dynamic lastName;






@dynamic results;

	
- (NSMutableSet*)resultsSet {
	[self willAccessValueForKey:@"results"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"results"];
  
	[self didAccessValueForKey:@"results"];
	return result;
}
	






@end
