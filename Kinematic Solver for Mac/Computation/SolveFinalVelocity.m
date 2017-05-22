//
//  SolveFinalVelocity.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import "SolveFinalVelocity.h"

@implementation SolveFinalVelocity

//Initialization
-(id) init {
    if(!(self = [ super init ]) )
        return nil;
    
    return self;
}

-(NSNumber*) calculateFinalVelocity: (NSError**) error {
    NSNumber* _answer;
    double temp;
    
    switch(_blankValue) {
        case 0:
            _answer = [[ NSNumber alloc ] initWithDouble:(_A * _T) + _Vi];
            break;
        case 1:
            temp = (_Vi * _Vi) + (2 * _A * _D);
            if( temp < 0){
                *error = [ KinematicSolver createError: @"The Values Entered Produce a Physics Scenario That is Not Possible!"
                                                Domain: @"com.Gorgichuk.KinematicSolver.UserDomain"
                                                  Code: 6 ];
                return nil;
            }
            
            temp = sqrt(temp);
            
            // Create the error.
            NSString *domain = @"com.Gorgichuk.KinematicSolver.ErrorDomain";
            
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            [userInfo setObject:@"Square Root has Two Possible Answers!" forKey:NSLocalizedDescriptionKey];
            [userInfo setObject: [[NSNumber alloc] initWithDouble:temp ] forKey: @"FirstValue"];
            [userInfo setObject: [[NSNumber alloc] initWithDouble:(temp * -1) ] forKey: @"SecondValue"];
            
            // Populate the error reference.
            *error = [[NSError alloc] initWithDomain:domain
                                                code:7
                                            userInfo:userInfo];
            return nil;
            break;
        case 2:
            _answer = [[ NSNumber alloc ] initWithDouble:( (2 * _D) / _T) - _Vi];
            break;
        case 3:
            _answer = [[ NSNumber alloc ] initWithDouble:(_D + (0.5 * _A * (_T * _T))) / _T];
            break;
        default:
            *error = [ KinematicSolver createError: @"No Blank Value Has Been Selected!"
                                            Domain: @"com.Gorgichuk.KinematicSolver.UserDomain"
                                              Code: 5 ];
            return nil;
    }
    _Vf =  [ _answer doubleValue ];
    return _answer;
}

@end
