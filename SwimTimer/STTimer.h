//
//  STTImer.h
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STTimer : NSObject

@property (strong, nonatomic) NSString* name;

-(BOOL)isRunning;
-(BOOL)hasStarted;

-(void)reset;
-(void)start;
-(void)stop;
-(void)lap;

-(NSTimeInterval) currentRunTime;
-(NSString*)timeString;
-(NSArray*)lapStrings;

- (void)startWithStartTime: (NSDate*)aStartTime;

@end

NSString* timeStringFor(NSTimeInterval aNumberOfSeconds);