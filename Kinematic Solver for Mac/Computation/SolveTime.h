//
//  SolveTime.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#ifndef SolveTime_h
#define SolveTime_h

#include "KinematicSolver.h"

@interface SolveTime : KinematicSolver

-(NSNumber*) calculateTime;
-(double) quadEquation:(double) a andb: (double) b withc:(double) c;

@end

#endif /* SolveTime_h */
