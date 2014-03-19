// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to STRaceResult.m instead.

#import "_STRaceResult.h"

const struct STRaceResultAttributes STRaceResultAttributes = {
	.date = @"date",
	.distance = @"distance",
	.stroke = @"stroke",
	.time = @"time",
};

const struct STRaceResultRelationships STRaceResultRelationships = {
	.swimmer = @"swimmer",
};

const struct STRaceResultFetchedProperties STRaceResultFetchedProperties = {
};

@implementation STRaceResultID
@end

@implementation _STRaceResult

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"STRaceResult" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"STRaceResult";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"STRaceResult" inManagedObjectContext:moc_];
}

- (STRaceResultID*)objectID {
	return (STRaceResultID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"distanceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"distance"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"time"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic date;






@dynamic distance;



- (int16_t)distanceValue {
	NSNumber *result = [self distance];
	return [result shortValue];
}

- (void)setDistanceValue:(int16_t)value_ {
	[self setDistance:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDistanceValue {
	NSNumber *result = [self primitiveDistance];
	return [result shortValue];
}

- (void)setPrimitiveDistanceValue:(int16_t)value_ {
	[self setPrimitiveDistance:[NSNumber numberWithShort:value_]];
}





@dynamic stroke;






@dynamic time;



- (float)timeValue {
	NSNumber *result = [self time];
	return [result floatValue];
}

- (void)setTimeValue:(float)value_ {
	[self setTime:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTimeValue {
	NSNumber *result = [self primitiveTime];
	return [result floatValue];
}

- (void)setPrimitiveTimeValue:(float)value_ {
	[self setPrimitiveTime:[NSNumber numberWithFloat:value_]];
}





@dynamic swimmer;

	






@end
