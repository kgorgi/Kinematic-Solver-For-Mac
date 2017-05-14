//
//  Kinematic_Solver_Tests.m
//  Kinematic Solver Tests
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "KinematicSolver.h"

@interface Kinematic_Solver_Tests : XCTestCase
- (void)testSetTime;

@end

@implementation Kinematic_Solver_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testSetTime {
    KinematicSolver *instance = [[ KinematicSolver alloc] init];
    [instance setDisplacement:@"5.0"];
    
    XCTAssertTrue([[instance getDisplacement] doubleValue] == 5.0);
    
}


@end
