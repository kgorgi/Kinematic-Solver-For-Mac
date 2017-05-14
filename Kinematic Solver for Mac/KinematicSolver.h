//
//  KinematicSolver.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-10-19.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//
#ifndef KinematicSolver_h
#define KinematicSolver_h
#import <Foundation/Foundation.h>

@interface KinematicSolver : NSObject {
    @private
        //Values Used To Determine Answer
        double _D;
        double _T;
        double _A;
        double _Vf;
        double _Vi;
        //Support Variables
        NSString* _blankValueStr;
        int _blankValue;
    @protected
        bool _exceptionThrown;
    
    
}

//Initialization - if adding a subclass that creates an init method, must add "_exceptionThrown = NO;" to that method
-(id) init; 

//Setters
-(void) setTime: (NSString*) time;
-(void) setDisplacement: (NSString*) displacement;
-(void) setAcceleration: (NSString*) accel;
-(void) setInitVelocity: (NSString*) initVelocity;
-(void) setFinVelocity: (NSString*) finVelocity;
-(void) setBlankValue: (NSString*) value;

//Getters
-(NSNumber*) getTime;
-(NSNumber*) getDisplacement;
-(NSNumber*) getAcceleration;
-(NSNumber*) getInitVelocity;
-(NSNumber*) getFinVelocity;
-(NSString*) getBlankValue;
-(NSNumber*) getBlankValueNum;
-(bool) getExceptionThrown;

//Calculator Specific Value, Convert Value to Double
-(NSNumber*) convertToDouble: (NSString*) str;

//Exception Handling Logging
-(void) ExceptionHandle:(NSException*) ex;

@end

#endif
