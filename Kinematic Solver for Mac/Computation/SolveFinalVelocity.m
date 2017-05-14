//
//  SolveFinalVelocity.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import "SolveFinalVelocity.h"

@implementation SolveFinalVelocity

-(NSNumber*) calculateFinVelocity
{
    NSNumber* _answer;
    double temp;
    
    @try {
        switch(_blankValue)
        {
            case 0:
                _answer = [[ NSNumber alloc ] initWithDouble:(_A * _T) + _Vi];
                break;
            case 1:
                temp = (_Vi * _Vi) + (2 * _A * _D);
                if( temp < 0)
                    [ NSException raise:@"Impossible Scenario" format:@"The Values Entered Produce a Physics Scenario That is Not Possible" ];
                _answer = [[ NSNumber alloc ] initWithDouble: [ self squareRoot:temp ]];
                break;
            case 2:
                _answer = [[ NSNumber alloc ] initWithDouble:( (2 * _D) / _T) - _Vi];
                break;
            case 3:
                _answer = [[ NSNumber alloc ] initWithDouble:(_D + (0.5 * _A * (_T * _T))) / _T];
                break;
            default:
                [ NSException raise:@"NoBlankValue" format:@"No Blank Value Has Been Selected" ];
                return NULL;
        }
        _Vf =  [ _answer doubleValue ];
        return _answer;
    }
    @catch (NSException *ex) {
        [ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
}

@end
