//
//  AppDelegate.h
//  Kinematic Solver For Mac
//
//  Created by Kian Gorgichuk on 14-06-09.
//  Copyright (c) 2015 Kian Gorgichuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

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
@end
