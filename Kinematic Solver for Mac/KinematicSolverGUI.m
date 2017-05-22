//
//  KinematicSolverGUI.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-10-20.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//
#ifndef KINEMATIC_SOLVER_GUI
#define KINEMATIC_SOLVER_GUI
#import "KinematicSolverGUI.h"

@implementation KinematicSolverGUI
-(id) initWithValues: (NSString*) time Displacement: (NSString*) displacement Acceleration: (NSString*) acceleration InitialVelocity: (NSString*) initVelocity FinalVelocity: (NSString*) finVelocity
{
    /*
    if(!(self = [ super init ]) )
        return nil;
    
    //Try to place values into private variables
    @try{
        int blankValues = 0;
        
        //Check for blank variables or variable to solve first then respond accordingly
        //No Exception Handling is Needed on the Solve Variable due to the variable being selected by a button
        
        //Displacement
        if([ displacement isEqualToString:@"SOLVE"] == YES)
        {
            //Do Nothing
        }
        else if ([ displacement isEqualToString:@""] == YES)
        {
            [ self setBlankValue: @"displacement" ];
            blankValues++;
        }
        else
        {
            [self setDisplacement: displacement];
        }
       
        //Time
        if([ time isEqualToString:@"SOLVE"] == YES)
        {
            //Do Nothing
        }
        else if ([ time isEqualToString:@""] == YES)
        {
            [ self setBlankValue: @"time" ];
            blankValues++;
        }
        else
        {
            [self setTime: time];
        }
        
        //Acceleration
        if([ acceleration isEqualToString:@"SOLVE"] == YES)
        {
            //Do Nothing
        }
        else if ([ acceleration isEqualToString:@""] == YES)
        {
            [ self setBlankValue: @"acceleration" ];
            blankValues++;
        }
        else
        {
            [ self setAcceleration:acceleration ];
        }
        
        //Initial Velocity
        if([ initVelocity isEqualToString:@"SOLVE"] == YES)
        {
           //Do Nothing
        }
        else if ([ initVelocity isEqualToString:@""] == YES)
        {
            [ self setBlankValue: @"InitVelocity" ];
            blankValues++;
            
        }
        else
        {
            [ self setInitVelocity: initVelocity ];
        }
        
        //Final Velocity
        if([ finVelocity isEqualToString:@"SOLVE"] == YES)
        {
            //Do Nothing
        }
        else if ([ finVelocity isEqualToString:@""] == YES)
        {
            [ self setBlankValue: @"FinVelocity" ];
            blankValues++;
        }
        else
        {
            [ self setFinVelocity: finVelocity ];
        }

        
        //Exception Handling
        if(blankValues == 0)
            [ NSException raise:@"TooManyValues" format:@"Too Many Values! Leave One Value Blank!" ];
        else if(blankValues > 1 )
            [ NSException raise:@"ValueBlank" format:@"Cannot Have Two or More Values Blank!" ];
        
    }
    @catch (NSException *ex)
    {
        [ self ExceptionHandle:ex ];
    }
    @finally
    {
        
    }
     */
    return self;
}

/*
-(double) squareRoot:(double)num
{
    double ans = sqrt(num);
    
    //Operation has two possible answers because of the nature of the Square root. (+ or -)
    NSLog(@"ERROR: Sqaure Root has Two Possible Answers");
    NSInteger alert = NSRunAlertPanel(@"Kinematic Solver For Mac", @"Sqaure Root has Two Possible Answers! Please Select the Correct Answer: Answer 1 = %f  Answer 2 = %f", @"Answer 1", @"Answer 2", nil, ans, ans * -1);
    switch(alert) {
        case NSAlertDefaultReturn:
        {
            return ans;
        }
        case NSAlertAlternateReturn:
        {
            return ans * -1;
        }
        default: return ans;
    }
 
 QUADRATIC EQUATION
 
 NSLog(@"ERROR: Quadratic Equation has Two Valid Roots!");
 NSInteger alert = NSRunAlertPanel(@"Kinematic Solver For Mac", @"Quadratic Equation has Two Valid Roots! Please Select the Correct Root: Root 1 = %f  Root 2 = %f",  @"Root 1", @"Root 2", nil, root1, root2);
 switch(alert) {
 case NSAlertDefaultReturn:
 {
 return root1;
 break;
 }
 case NSAlertAlternateReturn:
 {
 return root2;
 break;
 }
 default: break;
 
} */



@end
#endif
