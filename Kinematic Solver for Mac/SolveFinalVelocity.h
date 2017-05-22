//
//  SolveFinalVelocity.h
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#ifndef SolveFinalVelocity_h
#define SolveFinalVelocity_h

#import "KinematicSolver.h"

@interface SolveFinalVelocity : KinematicSolver

-(id) init;
-(NSNumber*) calculateFinalVelocity: (NSError**) error ;

@end

#endif /* SolveFinalVelocity_h */
