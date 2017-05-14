//
//  KinematicSolver.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-10-19.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//
#ifndef KINEMATIC_SOLVER
#define KINEMATIC_SOLVER

#import "KinematicSolver.h"

@implementation KinematicSolver

//Initialization
-(id) init
{
    if(!(self = [ super init ]) )
        return nil;
    
    _exceptionThrown = NO;
    return self;

}

//Setters
-(void) setTime: (NSString*) time
{
    NSNumber *t = [ self convertToDouble: time];
    
    @try {
        if( [t doubleValue] <= 0) {
            [ NSException raise:@"InvalidTime" format:@"Time Cannot Be Zero or Negative!" ];
        }
        else
            _T = [ t doubleValue];
    }
    @catch (NSException *ex) {
        [ self ExceptionHandle: ex ];
    }
    @finally {
        
    }
   
    
}
-(void) setDisplacement: (NSString*) displacement
{
    NSNumber *d = [ self convertToDouble: displacement ];
    _D = [ d doubleValue];

}
-(void) setAcceleration: (NSString*) accel
{
    NSNumber *a = [ self convertToDouble: accel ];
    _A = [ a doubleValue];

}
-(void) setInitVelocity: (NSString*) initVelocity
{
    NSNumber *vi = [ self convertToDouble: initVelocity ];
    _Vi = [ vi doubleValue];

}
-(void) setFinVelocity: (NSString*) finVelocity
{
    NSNumber *vf = [ self convertToDouble: finVelocity ];
    _Vf = [ vf doubleValue];

}
-(void) setBlankValue:(NSString*)value
{
    @try {
        _blankValueStr = [ [NSString alloc ] initWithString:value ];
        if([_blankValueStr isEqualToString:@"displacement"])
            _blankValue = 0;
        else if([_blankValueStr isEqualToString:@"time"])
            _blankValue = 1;
        else if([_blankValueStr isEqualToString:@"acceleration"])
            _blankValue = 2;
        else if([_blankValueStr isEqualToString:@"InitVelocity"])
            _blankValue = 3;
        else if([_blankValueStr isEqualToString:@"FinVelocity"])
            _blankValue = 4;
        else
            [ NSException raise:@"Invalid Value Given" format:@"setBlankValue parameter is not valid." ];

    }
    @catch (NSException *ex) {
        [ self ExceptionHandle: ex];
    }
    @finally {
        
    }
}

//Getters
-(NSNumber*) getTime
{
    NSNumber *t = [ [ NSNumber alloc ] initWithDouble:_T ];
    return t;
}
-(NSNumber*) getDisplacement
{
    NSNumber *d = [ [ NSNumber alloc ] initWithDouble:_D ];
    return d;
}
-(NSNumber*) getAcceleration
{
    NSNumber *a = [ [ NSNumber alloc ] initWithDouble:_A ];
    return a;
}
-(NSNumber*) getInitVelocity
{
    NSNumber *vi = [ [ NSNumber alloc ] initWithDouble:_Vi ];
    return vi;
}
-(NSNumber*) getFinVelocity
{
    NSNumber *vf = [ [ NSNumber alloc ] initWithDouble:_Vf ];
    return vf;
}

-(NSString*) getBlankValue
{
    return _blankValueStr;
}

-(NSNumber*) getBlankValueNum
{
    return [[NSNumber alloc] initWithInt: _blankValue];
}

-(bool) getExceptionThrown
{
    return _exceptionThrown;
}


//Convert To Double
-(NSNumber*) convertToDouble: (NSString*) str {
    NSNumberFormatter *f = [ [ NSNumberFormatter alloc ] init ];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *num = [ f numberFromString: str ];
    [ f release ];
    
    @try {
        if(num != nil)
            return num;
        else
         [ NSException raise:@"NotValidNum" format:@"A Value(s) Entered is Not a Valid Number" ];
    }
    @catch (NSException *ex) {
        [ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
    
}


//Exception Handling
-(void) ExceptionHandle:(NSException*) ex
{
    //Used to tell calling code that exception has occured
    _exceptionThrown = true;
    
    //Exception Handling Code
    NSLog(@"ERROR: %@", [ ex reason ]);
    
    @throw ex;
    //NSRunAlertPanel(@"Kinematic Solver For Mac",@"ERROR: %@", @"Close", nil, nil, [ex reason]);
    
}

@end
#endif
