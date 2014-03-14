//
//  STTImer.h
//  SwimTimer
//
//  Created by Roger Nolan on 13/03/2014.
//  Copyright (c) 2014 babbage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STTimer : NSObject
- (BOOL)isRunning; 
- (void)reset;
-(void)start;
-(void)stop;
-(void)lap;
-(NSString*)timeString;
-(NSArray*)lapStrings;
@end
