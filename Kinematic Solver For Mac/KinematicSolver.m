//
//  KinematicSolver.m
//  Kinematic Solver For Mac
//
//  Created by Kian Gorgichuk on 14-10-19.
//  Copyright (c) 2015 Kian Gorgichuk. All rights reserved.
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
-(bool) getExceptionThrown
{
    return _exceptionThrown;
}

-(NSNumber*) calculateDisplacement
{
    NSNumber* _answer;
    
    @try {
        switch(_blankValue)
        {
            case 1:
                _answer = [[ NSNumber alloc ] initWithDouble:( (_Vf * _Vf) - (_Vi * _Vi) ) / ( 2 * _A )];
                break;
            case 2:
                _answer = [[ NSNumber alloc ] initWithDouble:( (_Vi + _Vf) / 2 ) * _T ];
                break;
            case 3:
                _answer = [[ NSNumber alloc ] initWithDouble:(_Vf * _T) - (0.5 * _A * (_T * _T))];
                break;
            case 4:
                _answer = [[ NSNumber alloc ] initWithDouble:(_Vi * _T) + (0.5 * _A * (_T * _T))];
                break;
            default:
                [ NSException raise:@"NoBlankValue" format:@"No Blank Value Has Been Selected" ];
                return NULL;
                
        }
        _D =  [ _answer doubleValue ];
        return _answer;
    }
    @catch (NSException *ex) {
        [ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
}

-(NSNumber*) calculateTime
{
    NSNumber* _answer;
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
        [ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
}

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

-(NSNumber*) calculateInitVelocity
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
                _answer = [[ NSNumber alloc ] initWithDouble: [ self squareRoot:temp ]];
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
        [ self ExceptionHandle:ex ];
    }
    @finally {
        
    }
}

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


//MUST Be Overriden in a Category - KinematicSolverGUI.m is an example on how to properly override it.
-(double) quadEquation:(double) a andb: (double) b withc:(double) c { return 0.0; }
-(double) squareRoot:(double)num { return 0.0; }
-(void) ExceptionHandle:(NSException*) ex{ }

@end
#endif