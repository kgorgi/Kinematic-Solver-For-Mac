//
//  KinematicSolverGUI.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 14-10-20.
//  Copyright (c) 2017 Kian Gorgichuk. All rights reserved.
//

#import "KinematicSolver.h"

@interface KinematicSolverGUI : KinematicSolver
-(id) initWithValues: (NSString*) time Displacement: (NSString*) displacement Acceleration: (NSString*) acceleration InitialVelocity: (NSString*) initVelocity FinalVelocity: (NSString*) finVelocity;
-(double) quadEquation:(double) a andb: (double) b withc:(double) c;
-(double) squareRoot:(double) num;
-(void) ExceptionHandle:(NSException*) ex;
@end
