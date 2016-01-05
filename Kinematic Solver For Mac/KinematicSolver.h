//
//  KinematicSolver.h
//  Kinematic Solver For Mac
//
//  Created by Kian Gorgichuk on 14-10-19.
//  Copyright (c) 2014 Kian Gorgichuk. All rights reserved.
//

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
-(bool) getExceptionThrown;

//Calculator Specific Value, Convert Value to Double
-(NSNumber*) convertToDouble: (NSString*) str;
-(NSNumber*) calculateDisplacement;
-(NSNumber*) calculateTime;
-(NSNumber*) calculateAcceleration;
-(NSNumber*) calculateInitVelocity;
-(NSNumber*) calculateFinVelocity;

-(double) squareRoot:(double) num; //Use Subclass To Implement
-(double) quadEquation:(double) a andb: (double) b withc:(double) c;  //Use Subclass to Implement
//Exception Handling
-(void) ExceptionHandle:(NSException*) ex; //Use Subclass to Implement

@end
