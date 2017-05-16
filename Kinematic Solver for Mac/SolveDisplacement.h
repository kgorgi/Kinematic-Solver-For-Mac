//
//  SolveDisplacement.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#ifndef SolveDisplacement_h
#define SolveDisplacement_h

#import "KinematicSolver.h"

@interface SolveDisplacement : KinematicSolver

-(id) init;
-(NSNumber*) calculateDisplacement;

@end

#endif /* SolveDisplacement_h */
