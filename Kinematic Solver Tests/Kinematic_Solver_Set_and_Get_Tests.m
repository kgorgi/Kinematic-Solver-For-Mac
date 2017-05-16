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

@end

@implementation Kinematic_Solver_Set_and_Get_Tests

- (void)setUp {
[super setUp];
   instance = [[ KinematicSolver alloc] init];
}

- (void)tearDown {
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

- (void)testNegativeTime {
    NSNumber *num = [[NSNumber alloc] initWithDouble:-5.0];
    
    XCTAssertThrows([instance setTime:num], @"Failed to throw exception");
}

- (void)testSetBlankValueAccel {
    [instance setBlankValue: @"acceleration"];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"acceleration"]);
}


- (void)testSetBlankValueDis {
    [instance setBlankValue: @"displacement"];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"displacement"]);
}


- (void)testSetBlankValueTime{
    [instance setBlankValue: @"time"];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"time"]);
    
}


- (void)testSetBlankValueInitVelo{
    [instance setBlankValue: @"initialVelocity"];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"initialVelocity"]);
}


- (void)testSetBlankValueFinVelo{
    [instance setBlankValue: @"finalVelocity"];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"finalVelocity"]);
}


-(void)testSetBlankValueInvalid{
    
    XCTAssertThrows([instance setBlankValue: @"macintosh"], @"Failed to throw invalid argument exception!");
}
@end
