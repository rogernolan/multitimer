// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to STRaceResult.h instead.

#import <CoreData/CoreData.h>


extern const struct STRaceResultAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *distance;
	__unsafe_unretained NSString *stroke;
	__unsafe_unretained NSString *time;
} STRaceResultAttributes;

extern const struct STRaceResultRelationships {
	__unsafe_unretained NSString *swimmer;
} STRaceResultRelationships;

extern const struct STRaceResultFetchedProperties {
} STRaceResultFetchedProperties;

@class STSwimmer;






@interface STRaceResultID : NSManagedObjectID {}
@end

@interface _STRaceResult : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (STRaceResultID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* distance;



@property int16_t distanceValue;
- (int16_t)distanceValue;
- (void)setDistanceValue:(int16_t)value_;

//- (BOOL)validateDistance:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* stroke;



//- (BOOL)validateStroke:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* time;



@property float timeValue;
- (float)timeValue;
- (void)setTimeValue:(float)value_;

//- (BOOL)validateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) STSwimmer *swimmer;

//- (BOOL)validateSwimmer:(id*)value_ error:(NSError**)error_;





@end

@interface _STRaceResult (CoreDataGeneratedAccessors)

@end

@interface _STRaceResult (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSNumber*)primitiveDistance;
- (void)setPrimitiveDistance:(NSNumber*)value;

- (int16_t)primitiveDistanceValue;
- (void)setPrimitiveDistanceValue:(int16_t)value_;




- (NSString*)primitiveStroke;
- (void)setPrimitiveStroke:(NSString*)value;




- (NSNumber*)primitiveTime;
- (void)setPrimitiveTime:(NSNumber*)value;

- (float)primitiveTimeValue;
- (void)setPrimitiveTimeValue:(float)value_;





- (STSwimmer*)primitiveSwimmer;
- (void)setPrimitiveSwimmer:(STSwimmer*)value;


@end
