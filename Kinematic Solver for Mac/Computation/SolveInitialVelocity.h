//
//  SolveInitialVelocity.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#ifndef SolveInitialVelocity_h
#define SolveInitialVelocity_h

#import "KinematicSolver.h"

@interface SolveInitialVelocity : KinematicSolver

-(NSNumber*) calculateInitialVelocity;

@end

#endif /* SolveInitialVelocity_h */
