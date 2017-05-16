//
//  KinematicSolver.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-10-19.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//

#import "KinematicSolver.h"

@implementation KinematicSolver

//Initialization
-(id) init {
    if(!(self = [ super init ]) )
        return nil;
    
    return self;

}

//Setters
-(void) setTime: (NSString*) time {
    @try {
        if( [time doubleValue] <= 0) {
            [ NSException raise:@"InvalidTime" format:@"Time Cannot Be Zero or Negative!" ];
        }
        else {
            _T = [ time doubleValue];
        }
    }
    @catch (NSException *ex) {
        [ self ExceptionHandle: ex ];
    }
    @finally {
        
    }
}

-(void) setDisplacement: (NSNumber*) displacement {
    _D = [ displacement doubleValue];
}

-(void) setAcceleration: (NSNumber*) accel {
    _A = [ accel doubleValue];

}

-(void) setInitialVelocity: (NSNumber*) initVelocity {
    _Vi = [ initVelocity doubleValue];
}

-(void) setFinalVelocity: (NSNumber*) finVelocity {
    _Vf = [ finVelocity doubleValue];
}

-(void) setBlankValue:(NSString*)value {
    @try {
        _blankValueStr = [ [NSString alloc ] initWithString:value ];
        if([_blankValueStr isEqualToString:@"displacement"])
            _blankValue = 0;
        else if([_blankValueStr isEqualToString:@"time"])
            _blankValue = 1;
        else if([_blankValueStr isEqualToString:@"acceleration"])
            _blankValue = 2;
        else if([_blankValueStr isEqualToString:@"initialVelocity"])
            _blankValue = 3;
        else if([_blankValueStr isEqualToString:@"finalVelocity"])
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
-(NSNumber*) getTime {
    NSNumber *t = [ [ NSNumber alloc ] initWithDouble:_T ];
    return t;
}
-(NSNumber*) getDisplacement {
    NSNumber *d = [ [ NSNumber alloc ] initWithDouble:_D ];
    return d;
}
-(NSNumber*) getAcceleration {
    NSNumber *a = [ [ NSNumber alloc ] initWithDouble:_A ];
    return a;
}
-(NSNumber*) getInitialVelocity {
    NSNumber *vi = [ [ NSNumber alloc ] initWithDouble:_Vi ];
    return vi;
}
-(NSNumber*) getFinalVelocity {
    NSNumber *vf = [ [ NSNumber alloc ] initWithDouble:_Vf ];
    return vf;
}

-(NSString*) getBlankValue {
    return _blankValueStr;
}

//Exception Handling
-(void) ExceptionHandle:(NSException*) ex {
    //Exception Handling Code
    NSLog(@"ERROR: %@", [ ex reason ]);
    
    @throw ex;
    
    //NSRunAlertPanel(@"Kinematic Solver For Mac",@"ERROR: %@", @"Close", nil, nil, [ex reason]);
}

//Convert To Double
+(NSNumber*) convertToDouble: (NSString*) str {
    NSNumberFormatter *f = [ [ NSNumberFormatter alloc ] init ];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *num = [ f numberFromString: str ];
    [ f release ];
    
    if(num == nil)
    {
        [ NSException raise:@"NotValidNum" format:@"A Value(s) Entered is Not a Valid Number" ];

    }
    return num;
}

@end
