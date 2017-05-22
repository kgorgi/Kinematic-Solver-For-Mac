//
//  AppDelegate.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-06-09.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import"KinematicSolver.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

//Assign TextFields
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *txtDisplacement;
@property (assign) IBOutlet NSTextField *txtTime;
@property (assign) IBOutlet NSTextField *txtAcceleration;

@property (assign) IBOutlet NSTextField *txtInitialVelocity;
@property (assign) IBOutlet NSTextField *txtFinalVelocity;
@property (assign) IBOutlet NSMatrix *btnsSolveFor;

//Assign Button & Methods
- (IBAction)calculateValue:(NSButton *)sender;
- (IBAction)solvedForClicked:(id)sender;
- (IBAction)clearAllClicked:(id)sender;

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication;
//Helper Methods
-(KinematicSolver*) initializeKinematicSolver;
-(NSNumber*) calculateAnswer:(KinematicSolver*) kSolve;

//Error Handling
-(void)displayError:(NSError*) error;
-(void)displayErrorWithMessage:(NSString*) msg;
@end
