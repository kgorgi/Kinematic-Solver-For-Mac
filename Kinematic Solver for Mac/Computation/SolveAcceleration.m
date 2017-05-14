//
//  SolveAcceleration.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#include "SolveAcceleration.h"

@implementation SolveAcceleration

-(NSNumber*) calculateAcceleration
{
    NSNumber* _answer;
    @try {
        switch(_blankValue)
        {
            case 0:
                _answer = [[ NSNumber alloc ] initWithDouble:(_Vf - _Vi) / _T];
                break;
            case 1:
                _answer = [[ NSNumber alloc ] initWithDouble:( (_Vf * _Vf) - (_Vi * _Vi) ) / ( 2 * _D )];
                break;
            case 3:
                _answer = [[ NSNumber alloc ] initWithDouble:(_D - (_Vf * _T)) / ( -1 * 0.5 * (_T * _T))];
                NSLog(@"TEST");
                break;
            case 4:
                _answer = [[ NSNumber alloc ] initWithDouble: ( (_D - (_Vi * _T)) / (0.5 * (_T * _T)) )];
                break;
            default:
                [ NSException raise:@"NoBlankValue" format:@"No Blank Value Has Been Selected" ];
                return NULL;
        }
        _A =  [ _answer doubleValue ];
        return _answer;
    }
    @catch (NSException *ex) {
        [ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
}

@end
