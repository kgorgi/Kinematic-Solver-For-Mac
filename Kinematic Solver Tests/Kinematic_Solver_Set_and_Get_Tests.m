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
    
    [instance setTime:num andError: nil];
    
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
    
    NSError* err;
    
    bool success = [instance setTime:num andError: &err];
    
    if(!success && err != nil){
        if([err code] == 1 && [[err domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}
- (void)testSetBlankValueAccel {
    [instance setBlankValue: @"Acceleration" andError: nil];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"Acceleration"]);
}


- (void)testSetBlankValueDis {
    [instance setBlankValue: @"Displacement" andError: nil];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"Displacement"]);
}


- (void)testSetBlankValueTime{
    [instance setBlankValue: @"Time" andError: nil];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"Time"]);
    
}


- (void)testSetBlankValueInitVelo{
    [instance setBlankValue: @"InitialVelocity" andError: nil];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"InitialVelocity"]);
}


- (void)testSetBlankValueFinVelo{
    [instance setBlankValue: @"FinalVelocity" andError: nil];
    
    XCTAssertTrue([[instance getBlankValue] isEqualToString:@"FinalVelocity"]);
}


-(void)testSetBlankValueInvalid{
    
    NSError* err;
    
    bool success = [instance setBlankValue: @"macintosh" andError: &err];
    
    if(!success && err != nil){
        if([err code] == 2 && [[err domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}
@end
