// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to STSwimmer.h instead.

#import <CoreData/CoreData.h>


extern const struct STSwimmerAttributes {
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} STSwimmerAttributes;

extern const struct STSwimmerRelationships {
	__unsafe_unretained NSString *results;
} STSwimmerRelationships;

extern const struct STSwimmerFetchedProperties {
} STSwimmerFetchedProperties;

@class STRaceResult;




@interface STSwimmerID : NSManagedObjectID {}
@end

@interface _STSwimmer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (STSwimmerID*)objectID;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *results;

- (NSMutableSet*)resultsSet;





@end

@interface _STSwimmer (CoreDataGeneratedAccessors)

- (void)addResults:(NSSet*)value_;
- (void)removeResults:(NSSet*)value_;
- (void)addResultsObject:(STRaceResult*)value_;
- (void)removeResultsObject:(STRaceResult*)value_;

@end

@interface _STSwimmer (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;





- (NSMutableSet*)primitiveResults;
- (void)setPrimitiveResults:(NSMutableSet*)value;


@end
