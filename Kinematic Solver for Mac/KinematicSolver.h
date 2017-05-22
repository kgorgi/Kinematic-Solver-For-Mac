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
    @protected
        //Values Used To Determine Answer
        double _D;
        double _T;
        double _A;
        double _Vf;
        double _Vi;
    
        //Support Variables
        NSString* _blankValueStr;
        int _blankValue;
}

//Initialization
-(id) init;

//Setters
-(bool) setTime: (NSNumber*) time andError: (NSError**) error;
-(void) setDisplacement: (NSNumber*) displacement;
-(void) setAcceleration: (NSNumber*) accel;
-(void) setInitialVelocity: (NSNumber*) initVelocity;
-(void) setFinalVelocity: (NSNumber*) finVelocity;
-(bool) setBlankValue: (NSString*) value andError: (NSError**) error;
-(void) setBlankValueTesting: (int) variable; //Note this method may only be used for testing;

//Getters
-(NSNumber*) getTime;
-(NSNumber*) getDisplacement;
-(NSNumber*) getAcceleration;
-(NSNumber*) getInitialVelocity;
-(NSNumber*) getFinalVelocity;
-(NSString*) getBlankValue;

//Calculator Specific Value, Convert Value to Double
+(NSNumber*) convertToDouble: (NSString*) str andError: (NSError**) error;

//Exception Handling Logging
+(NSError*) createError: (NSString*) msg Domain: (NSString*) dom Code:(int) c;
@end

#endif
