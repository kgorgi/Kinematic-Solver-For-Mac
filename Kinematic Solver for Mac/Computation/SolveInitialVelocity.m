//
//  SolveInitialVelocity.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import "SolveInitialVelocity.h"

@implementation SolveInitialVelocity

-(NSNumber*) calculateInitialVelocity
{
    NSNumber* _answer;
    double temp;
    
    @try {
        switch(_blankValue)
        {
            case 0:
                _answer = [[ NSNumber alloc ] initWithDouble:_Vf - (_A * _T)];
                break;
            case 1:
                temp = (_Vf * _Vf) - (2 * _A * _D);
                if( temp < 0)
                    [ NSException raise:@"Impossible Scenario" format:@"The Values Entered Produce a Physics Scenario That is Not Possible" ];
                //_answer = [[ NSNumber alloc ] initWithDouble: [ self squareRoot:temp ]];
                break;
            case 2:
                _answer = [[ NSNumber alloc ] initWithDouble:( (2 * _D) / _T) - _Vf];
                break;
            case 4:
                _answer = [[ NSNumber alloc ] initWithDouble:(_D - (0.5 * _A * (_T * _T))) / _T];
                break;
            default:
                return NULL;
        }
        _Vi =  [ _answer doubleValue ];
        return _answer;
    }
    @catch (NSException *ex) {
        //[ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
}

@end
