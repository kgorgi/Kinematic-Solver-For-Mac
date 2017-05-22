//
//  SolveDisplacement.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import "SolveDisplacement.h"

@implementation SolveDisplacement

//Initialization
-(id) init {
    if(!(self = [ super init ]) )
        return nil;
    
    return self;
}

-(NSNumber*) calculateDisplacement: (NSError**) error {
    NSNumber* answer;
    
    switch(_blankValue){
        case 1:
            if(_A == 0){
                *error = [ KinematicSolver createError: @"Divide By Zero Error: Acceleration Set to Zero!"
                                                Domain: @"com.Gorgichuk.KinematicSolver.UserDomain"
                                                  Code: 4 ];
                return nil;
            }
            answer = [[ NSNumber alloc ] initWithDouble:( (_Vf * _Vf) - (_Vi * _Vi) ) / ( 2 * _A )];
            break;
        case 2:
            answer = [[ NSNumber alloc ] initWithDouble:( (_Vi + _Vf) / 2 ) * _T ];
            break;
        case 3:
            answer = [[ NSNumber alloc ] initWithDouble:(_Vf * _T) - (0.5 * _A * (_T * _T))];
            break;
        case 4:
            answer = [[ NSNumber alloc ] initWithDouble:(_Vi * _T) + (0.5 * _A * (_T * _T))];
            break;
        default:
            *error = [ KinematicSolver createError: @"No Blank Value Has Been Selected!"
                                            Domain: @"com.Gorgichuk.KinematicSolver.UserDomain"
                                              Code: 5 ];
            return nil;
            break;
            
    }
    _D =  [ answer doubleValue ];
    return answer;
 }

@end
