//
//  SolveAcceleration.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#include "SolveAcceleration.h"

@implementation SolveAcceleration

//Initialization
-(id) init {
    if(!(self = [ super init ]) )
        return nil;
    
    return self;
}

//Method returns nil if error occures.
-(NSNumber*) calculateAcceleration: (NSError**) error{
    NSNumber* answer;
    
    switch(_blankValue) {
        case 0:
            answer = [[ NSNumber alloc ] initWithDouble:(_Vf - _Vi) / _T];
            break;
        case 1:
            if(_D == 0){
                *error = [ KinematicSolver createError: @"Divide By Zero\nDisplacement Set to Zero!"
                                                Domain: @"com.Gorgichuk.KinematicSolver.UserDomain"
                                                  Code: 4 ];
                return nil;
            }
            answer = [[ NSNumber alloc ] initWithDouble:( (_Vf * _Vf) - (_Vi * _Vi) ) / ( 2 * _D )];
            break;
        case 3:
            answer = [[ NSNumber alloc ] initWithDouble:(_D - (_Vf * _T)) / ( -1 * 0.5 * (_T * _T))];
            break;
        case 4:
            answer = [[ NSNumber alloc ] initWithDouble: ( (_D - (_Vi * _T)) / (0.5 * (_T * _T)) )];
            break;
        default:
            *error = [ KinematicSolver createError: @"No Blank Value Has Been Selected!"
                                            Domain: @"com.Gorgichuk.KinematicSolver.UserDomain"
                                              Code: 5 ];
            return nil;
            break;
    }
    _A = [ answer doubleValue ];
    return answer;
}

@end
