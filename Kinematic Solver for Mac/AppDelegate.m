//
//  AppDelegate.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-06-09.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//

#import "AppDelegate.h"
#import "SolveDisplacement.h"
#import "SolveTime.h"
#import "SolveAcceleration.h"
#import "SolveInitialVelocity.h"
#import "SolveFinalVelocity.h"

@implementation AppDelegate

//Import Text Fields and Solve Button
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
    
    KinematicSolver* k = [self initializeKinematicSolver];
    if(k == nil){
        return;
    }
    
    NSNumber* ans = [self calculateAnswer:k];
    
    if(ans == nil){
        return;
    }
    
    //Print Answer as Alert Box
    switch ([ btnsSolveFor selectedRow ]) {
        case 0:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The displacement is: %@ m", @"Close", nil, nil, [ ans stringValue ]);
            break;
        case 1:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The time is: %@ s", @"Close", nil, nil, [ ans stringValue ]);
            break;
        case 2:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The acceleration is: %@ m/s²", @"Close", nil, nil, [ ans stringValue ]);
            break;
        case 3:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The initial velocity is: %@ m/s", @"Close", nil, nil, [ ans stringValue ]);
            break;
        case 4:
            NSRunAlertPanel(@"Kinematic Equation Solver for Mac", @"The final velocity is: %@ m/s", @"Close", nil, nil, [ ans stringValue ]);
            break;
        default:
            break;
    }
}


- (IBAction)solvedForClicked:(id)sender {
    
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
}

- (IBAction)clearAllClicked:(id)sender{
    NSString *clearString = [ [ NSString alloc ] initWithString:@""];
    [ txtDisplacement setStringValue:clearString];
    [ txtTime setStringValue:clearString];
    [ txtAcceleration setStringValue:clearString];
    [ txtInitialVelocity setStringValue:clearString];
    [ txtFinalVelocity setStringValue:clearString];
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

//Method returns nil if error occures.
-(KinematicSolver*) initializeKinematicSolver{
    
    //Pull Strings From TextFields and Initialize Variables
    NSString *stringd = [ [ NSString alloc ] initWithString:[ txtDisplacement stringValue ] ];
    NSString *stringt = [ [ NSString alloc ] initWithString:[ txtTime stringValue ] ];
    NSString *stringa = [ [ NSString alloc ] initWithString:[ txtAcceleration stringValue ] ];
    NSString *stringvi = [ [ NSString alloc ] initWithString: [ txtInitialVelocity stringValue ] ];
    NSString *stringvf = [ [ NSString alloc ] initWithString:[ txtFinalVelocity stringValue ] ];
    
    KinematicSolver* kinSolve;
    
    switch( [ btnsSolveFor selectedRow])
    {
        case 0:
            kinSolve = [[SolveDisplacement alloc] init];
            break;
        case 1:
            kinSolve = [[SolveTime alloc] init];
            break;
        case 2:
            kinSolve = [[SolveAcceleration alloc] init];
            break;
        case 3:
            kinSolve = [[SolveInitialVelocity alloc] init];
            break;
        case 4:
            kinSolve = [[SolveFinalVelocity alloc] init];
            break;
        default:
            [self displayErrorWithMessage: @"Fatal Error, No Variable Set to Solve!"];
            return nil;
            break;
    }
    
    
    //Set Values
    int blankValues = 0;
    NSError* converToDoubleError;
    NSError* blankSetError;
    
    //Displacement
    if([stringd isEqualToString:@""]){
        blankValues++;
        
        //Set Blank Value
        if([ btnsSolveFor selectedRow] != 0){
            if(![kinSolve setBlankValue:@"Displacement" andError:&blankSetError]){
                [self displayError:blankSetError];
                return nil;
            }
        }
    } else{
        NSNumber* dNum = [KinematicSolver convertToDouble:stringd andError:&converToDoubleError];
        if(dNum == nil){
            [self displayError:converToDoubleError];
            return nil;
        }
        
        [kinSolve setDisplacement: dNum];
    }
    
    //Time
    NSError *timeError;
    if([stringt isEqualToString:@""]){
        blankValues++;
        
        //Set Blank Value
        if([ btnsSolveFor selectedRow] != 1){
            if(![kinSolve setBlankValue:@"Time" andError:&blankSetError]){
                [self displayError:blankSetError];
                return nil;
            }
        }
        
    } else{
        NSNumber* tNum = [KinematicSolver convertToDouble:stringt andError:&converToDoubleError];
        if(tNum == nil){
            [self displayError:converToDoubleError];
            return nil;
        }
        
        //Time Error Checking
        if(![kinSolve setTime: tNum andError: &timeError]){
            [self displayError:timeError];
            return nil;
        }
    }
    
    //Acceleration
    if([stringa isEqualToString:@""]){
        blankValues++;
        
        //Set Blank Value
        if([ btnsSolveFor selectedRow] != 2){
            if(![kinSolve setBlankValue:@"Acceleration" andError:&blankSetError]){
                [self displayError:blankSetError];
                return nil;
            }
        }
    } else{
        NSNumber* aNum = [KinematicSolver convertToDouble:stringa andError:&converToDoubleError];
        if(aNum == nil){
            [self displayError:converToDoubleError];
            return nil;
        }
       
        [kinSolve setAcceleration: aNum];
    }
    
    //Initial Velocity
    if([stringvi isEqualToString:@""]){
        blankValues++;
        
        //Set Blank Value
        if([ btnsSolveFor selectedRow] != 3){
            if(![kinSolve setBlankValue:@"InitialVelocity" andError:&blankSetError]){
                [self displayError:blankSetError];
                return nil;
            }
        }
    } else{
        NSNumber* viNum = [KinematicSolver convertToDouble:stringvi andError:&converToDoubleError];
        if(viNum == nil){
            [self displayError:converToDoubleError];
            return nil;
        }
        
        [kinSolve setInitialVelocity: viNum];
    }
    
    //Final Velocity
    if([stringvf isEqualToString:@""]){
        blankValues++;
        
        //Set Blank Value
        if([ btnsSolveFor selectedRow] != 4){
            if(![kinSolve setBlankValue:@"FinalVelocity" andError:&blankSetError]){
                [self displayError:blankSetError];
                return nil;
            }
        }
    } else{
        NSNumber* vfNum = [KinematicSolver convertToDouble:stringvf andError:&converToDoubleError];
        if(vfNum == nil){
            [self displayError:converToDoubleError];
            return nil;
        }
        
        [kinSolve setFinalVelocity: vfNum];
    }
    
    //Check to Make Sure Correct Amount of Values are Set.
    if(blankValues == 0){
        [self displayErrorWithMessage: @"Too Many Values! Leave One Value Blank!"];
        return nil;
    } else if(blankValues > 2){
        [self displayErrorWithMessage: @"Cannot Have Two or More Values Blank!"];
        return nil;
    }
    
    return kinSolve;
}

//Method returns nil if error occures.
-(NSNumber*) calculateAnswer:(KinematicSolver*) kSolve{
    //Calculate Answer
    NSNumber* calcAns;
    NSError* computationError;
    
    switch( [ btnsSolveFor selectedRow]){
        case 0:
            calcAns = [ (SolveDisplacement*)kSolve calculateDisplacement: &computationError ];
            break;
        case 1:
            calcAns = [ (SolveTime*)kSolve calculateTime: &computationError ];
            break;
        case 2:
            calcAns = [ (SolveAcceleration*)kSolve calculateAcceleration: &computationError ];
            break;
        case 3:
            calcAns = [ (SolveInitialVelocity*)kSolve calculateInitialVelocity: &computationError ];
            break;
        case 4:
            calcAns = [ (SolveFinalVelocity*)kSolve calculateFinalVelocity: &computationError ];
            break;
        default:
            [self displayErrorWithMessage: @"Fatal Error, Not Variable Set to Solve!"];
            return nil;
            break;
    }
    
    //Error Checking
    if(calcAns == nil) {
        if([computationError code] == 7){
            
            //Operation has two possible answers because of the nature of the Square root. (+ or -)
            double firstValue = [[[computationError userInfo] objectForKey: @"FirstValue"] doubleValue ];
            double secondValue = [[[computationError userInfo] objectForKey: @"SecondValue"] doubleValue ];
            
            NSLog(@"ERROR: Sqaure Root has Two Possible Answers");
            NSInteger alert = NSRunAlertPanel(@"Kinematic Solver for Mac", @"Sqaure Root has Two Possible Answers! Please Select the Correct Answer: Answer 1 = %f  Answer 2 = %f", @"Answer 1", @"Answer 2", nil, firstValue, secondValue);
            
            switch(alert) {
                case NSAlertDefaultReturn:
                    calcAns = [[computationError userInfo] objectForKey: @"FirstValue"];
                    break;
                case NSAlertAlternateReturn:
                    calcAns = [[computationError userInfo] objectForKey: @"SecondValue"];
                    break;
                default:
                    [self displayErrorWithMessage: @"Fatal Error, Alert Panel Returned Unknown Value!"];
                    return nil;
                    break;
            }
        } else if([computationError code] == 8){
            
            //Two Valid Roots!
            double firstValue = [[[computationError userInfo] objectForKey: @"FirstValue"] doubleValue ];
            double secondValue = [[[computationError userInfo] objectForKey: @"SecondValue"] doubleValue ];
            
            NSLog(@"ERROR: Quadratic Equation has Two Valid Roots!");
            NSInteger alert = NSRunAlertPanel(@"Kinematic Solver for Mac", @"Quadratic Equation has Two Valid Roots! Please Select the Correct Root: Root 1 = %f  Root 2 = %f",  @"Root 1", @"Root 2", nil, firstValue, secondValue);
            
            switch(alert) {
                case NSAlertDefaultReturn:
                    calcAns = [[computationError userInfo] objectForKey: @"FirstValue"];
                    break;
                case NSAlertAlternateReturn:
                    calcAns = [[computationError userInfo] objectForKey: @"SecondValue"];
                    break;
                default:
                    [self displayErrorWithMessage: @"Fatal Error, Alert Panel Returned Unknown Value!"];
                    return nil;
                    break;
            }
        } else{
            //Display other errors (codes 1 - 6)
            [self displayError:computationError];
            return nil;
        }
    }
    return calcAns;
}

-(void)displayError:(NSError*) error{
    NSLog(@"ERROR: %@", [[error userInfo] objectForKey: NSLocalizedDescriptionKey]);
    NSRunAlertPanel(@"Kinematic Solver for Mac",@"ERROR: %@", @"Close", nil, nil, [[error userInfo] objectForKey: NSLocalizedDescriptionKey]);
}

-(void)displayErrorWithMessage:(NSString*) msg{
    NSLog(@"ERROR: %@", msg);
    NSRunAlertPanel(@"Kinematic Solver for Mac",@"ERROR: %@", @"Close", nil, nil, msg);
}

@end
