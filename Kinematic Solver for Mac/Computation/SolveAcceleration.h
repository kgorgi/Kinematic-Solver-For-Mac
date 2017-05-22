//
//  SolveAcceleration.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#ifndef SolveAcceleration_h
#define SolveAcceleration_h

#import "KinematicSolver.h"

@interface SolveAcceleration : KinematicSolver

-(id) init;
-(NSNumber*) calculateAcceleration: (NSError**) error;

@end


#endif /* SolveAcceleration_h */
