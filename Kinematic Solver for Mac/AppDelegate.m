//
//  AppDelegate.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-06-09.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//

#import "AppDelegate.h"
#import "KinematicSolver.h"
#import "KinematicSolverGUI.h"

//Import Text Fields
@implementation AppDelegate
@synthesize txtDisplacement;
@synthesize txtTime;
@synthesize txtAcceleration;
@synthesize txtInitialVelocity;
@synthesize txtFinalVelocity;
@synthesize btnsSolveFor;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [ txtTime becomeFirstResponder];
    [ txtDisplacement setEnabled:NO ];
}

//Action to Calculate Value
- (IBAction)calculateValue:(NSButton *)sender {
    /*
    //Pull Strings From TextFields and Initialize Variables
    NSString *stringd = [ [ NSString alloc ] initWithString:[ txtDisplacement stringValue ] ];
    NSString *stringt = [ [ NSString alloc ] initWithString:[ txtTime stringValue ] ];
    NSString *stringa = [ [ NSString alloc ] initWithString:[ txtAcceleration stringValue ] ];
    NSString *stringvi = [ [ NSString alloc ] initWithString: [ txtInitialVelocity stringValue ] ];
    NSString *stringvf = [ [ NSString alloc ] initWithString:[ txtFinalVelocity stringValue ] ];
    
    //Set Solve String
    switch( [ btnsSolveFor selectedRow ] )
    {
        case 0:
            stringd = [ [ NSString alloc ] initWithString:@"SOLVE" ];
            break;
        case 1:
            stringt = [ [ NSString alloc ] initWithString:@"SOLVE" ];
            break;
        case 2:
            stringa = [ [ NSString alloc ] initWithString:@"SOLVE" ];
            break;
        case 3:
            stringvi = [ [ NSString alloc ] initWithString:@"SOLVE" ];
            break;
        case 4:
            stringvf = [ [ NSString alloc ] initWithString:@"SOLVE" ];
            break;
        default:
            break;
    }
        
    //Init Kinematic Solver Class with Values
    KinematicSolverGUI *kinSolve = [ [ KinematicSolverGUI alloc ] initWithValues:stringt Displacement:stringd Acceleration:stringa InitialVelocity:stringvi FinalVelocity:stringvf ];
    
    //Check if any exception has been raised by kinSolve
    if([kinSolve getExceptionThrown])
        return;
    
    //Calculate answer
    NSNumber *calcAns = [ [ NSNumber alloc ] init ];
    
    switch( [ btnsSolveFor selectedRow])
    {
        case 0:
            calcAns = [ kinSolve calculateDisplacement ];
            break;
        case 1:
            calcAns = [ kinSolve calculateTime ];
            break;
        case 2:
            calcAns = [ kinSolve calculateAcceleration ];
            break;
        case 3:
            calcAns = [ kinSolve calculateInitVelocity ];
            break;
        case 4:
            calcAns = [ kinSolve calculateFinVelocity ];
            break;
        default:
            break;
    }
        

    //Check if any exception has been raised by kinSolve
    if([kinSolve getExceptionThrown])
        return;
    
    //Print Answer as Alert Box
    switch ([ btnsSolveFor selectedRow ]) {
        case 0:
             NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The displacement is: %@ m", @"Close", nil, nil, [ calcAns stringValue ]);
            break;
        case 1:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The time is: %@ s", @"Close", nil, nil, [ calcAns stringValue ]);
            break;
        case 2:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The acceleration is: %@ m/s²", @"Close", nil, nil, [ calcAns stringValue ]);
            break;
        case 3:
           NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The initial velocity is: %@ m/s", @"Close", nil, nil, [ calcAns stringValue ]);
            break;
        case 4:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The final velocity is: %@ m/s", @"Close", nil, nil, [ calcAns stringValue ]);
            break;
        default:
            break;
    }
    
    //CleanUp
    [ stringd release ];
    [ stringt release ];
    [ stringa release ];
    [ stringvi release ];
    [ stringvf release ];
    [ calcAns release ];
    [ kinSolve release ];
     */
} 

- (IBAction)solvedForClicked:(id)sender {
    /*
    //Enable All TextBoxs
    [ txtDisplacement setEnabled:YES ];
    [ txtTime setEnabled:YES ];
    [ txtAcceleration setEnabled:YES ];
    [ txtInitialVelocity setEnabled:YES ];
    [ txtFinalVelocity setEnabled:YES ];
    
    
    //Disable Selected TextBox and Clear Textbox
    NSString *clearString = [ [ NSString alloc ] initWithString:@""];
    if([ btnsSolveFor selectedRow ] == 0 )
    {
        [ txtDisplacement setStringValue:clearString];
        [ txtDisplacement setEnabled:NO ];
    }
    else if( [ btnsSolveFor selectedRow ] == 1 )
    {
        [ txtTime setStringValue:clearString];
        [ txtTime setEnabled:NO ];
    }
    else if( [ btnsSolveFor selectedRow ] == 2 )
    {
        [ txtAcceleration setStringValue:clearString];
        [ txtAcceleration setEnabled:NO ];
    }
    else if( [ btnsSolveFor selectedRow ] == 3 )
    {
        [ txtInitialVelocity setStringValue:clearString];
        [ txtInitialVelocity setEnabled:NO ];
    }
    else if( [ btnsSolveFor selectedRow ] == 4 )
    {
        [ txtFinalVelocity setStringValue:clearString];
        [ txtFinalVelocity setEnabled:NO ];
    }
     */
}

@end
