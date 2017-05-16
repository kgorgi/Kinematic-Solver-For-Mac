//
//  Kinematic_Solver_Tests.m
//  Kinematic Solver Tests
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KinematicSolver.h"

@interface Kinematic_Solver_Set_and_Get_Tests : XCTestCase {
    @private
        KinematicSolver *instance;
    
}
- (void)testSetDisplacement;
- (void)testSetTime;
- (void)testSetAcceleration;
- (void)testSetInitalVelocity;
- (void)testSetFinalVelocity;
- (void)testNegativeTime;

@end

@implementation Kinematic_Solver_Set_and_Get_Tests

- (void)setUp {
[super setUp];
   instance = [[ KinematicSolver alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testSetDisplacement {
    NSNumber *num = [[NSNumber alloc] initWithDouble:52.69];
    
    [instance setDisplacement:num];
    
    XCTAssertTrue([[instance getDisplacement] doubleValue] == 52.69);
    
}

- (void)testSetTime {
    NSNumber *num = [[NSNumber alloc] initWithDouble:52.69];
    
    [instance setTime:num];
    
    XCTAssertTrue([[instance getTime] doubleValue] == 52.69);
    
}

- (void)testSetAcceleration {
    NSNumber *num = [[NSNumber alloc] initWithDouble:-52.75];
    
    [instance setAcceleration:num];
    
    XCTAssertTrue([[instance getAcceleration] doubleValue] == -52.75);
    
}

- (void)testSetInitalVelocity{
    NSNumber *num = [[NSNumber alloc] initWithDouble:12.5];
    
    [instance setInitialVelocity:num];
    
    XCTAssertTrue([[instance getInitialVelocity] doubleValue] == 12.5);
    
}

- (void)testSetFinalVelocity {
    NSNumber *num = [[NSNumber alloc] initWithDouble:100.5];
    
    [instance setFinalVelocity:num];
    
    XCTAssertTrue([[instance getFinalVelocity] doubleValue] == 100.5);
    
}

- (void)testSetBlankValue {
    NSNumber *num = [[NSNumber alloc] initWithDouble:100.5];
    
    [instance setFinalVelocity:num];
    
    XCTAssertTrue([[instance getFinalVelocity] doubleValue] == 100.5);
    
}

- (void)testNegativeTime {
    NSNumber *num = [[NSNumber alloc] initWithDouble:-5.0];
    
    XCTAssertThrows([instance setTime:num], @"Failed to throw exception");
}


@end
