//
//  SolveTime.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import "SolveTime.h"

@implementation SolveTime

//Initialization
-(id) init {
    if(!(self = [ super init ]) )
        return nil;
    
    return self;
}

-(NSNumber*) calculateTime {
    /*NSNumber* _answer;
    double a, b, c;
    
    @try {
        switch(_blankValue)
        {
            case 0:
                _answer = [[ NSNumber alloc ] initWithDouble:(_Vf - _Vi) / _A];
                break;
            case 2:
                _answer = [[ NSNumber alloc ] initWithDouble:(2 * _D) / (_Vi + _Vf)];
                printf("%f %f %f", _D, _Vi, _Vf);
                break;
            case 3:
                if(_A == 0)
                {
                    _answer = [[ NSNumber alloc ] initWithDouble: fabs(_D / _Vf) ];
                }
                else
                {
                    //Convert Values into Quadratic Function Variables and Calculate Answer
                    a = (0.5 * _A);
                    b = ( -1 * _Vf);
                    c = _D;
                    
                    _answer = [[ NSNumber alloc ] initWithDouble: [ self quadEquation:a andb:b withc:c] ];
                }
                break;
            case 4:
                if(_A == 0)
                {
                    _answer = [[ NSNumber alloc ] initWithDouble: fabs(_D / _Vi) ];
                }
                else
                {
                    
                    //Convert Values into Quadratic Function Variables and Calculate Answer
                    a = (0.5 * _A);
                    b = _Vi;
                    c = (-1 * _D);
                    
                    _answer = [[ NSNumber alloc ] initWithDouble: [self quadEquation:a andb:b withc:c]];
                }
                break;
            default:
                [ NSException raise:@"NoBlankValue" format:@"No Blank Value Has Been Selected" ];
                return NULL;
        }
        _T =  [ _answer doubleValue ];
        return _answer;
    }
    @catch (NSException *ex) {
        //[ self ExceptionHandle:ex ];
    }
    @finally {
        
    }*/
    return nil;
}
    
+(double) quadEquation: (NSError**) error A:(double) a andb: (double) b withc:(double) c {
    //Calculate Roots
    double root1 = ( (-1 * b) + sqrt( (b * b) - (4 * a * c))) / (2 * a);
    double root2 = ( (-1 * b) - sqrt( (b * b) - (4 * a * c))) / (2 * a);
    
    //Roots Equal
    if(root1 == root2){
        return root1;
    }

    //Both Roots are Positive (time cannot be negative)
    else if (root1 >= 0 && root2 >= 0) {
        // Create the error.
        NSString *domain = @"com.Gorgichuk.KinematicSolver.ErrorDomain";
        
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        [userInfo setObject:@"Quadratic Equation has Two Valid Roots!" forKey:NSLocalizedDescriptionKey];
        [userInfo setObject: [[NSNumber alloc] initWithDouble: root1 ] forKey: @"FirstValue"];
        [userInfo setObject: [[NSNumber alloc] initWithDouble: root2 ] forKey: @"SecondValue"];
        
        // Populate the error reference.
        *error = [[NSError alloc] initWithDomain:domain
                                            code:8
                                        userInfo:userInfo];
        return -1;
       
    }
    //Root 1 is Positive, Root 2 is Negative
    else if (root1 >= 0 && root2 < 0){
        return root1;
    }

    //Root 1 is Negative, Root 2 is Positive
    return root2;
}

@end
