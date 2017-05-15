//
//  convertToDouble_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-14.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KinematicSolver.h"

@interface convertToDouble_Tests : XCTestCase

@end

@implementation convertToDouble_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testBasic{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"5"] doubleValue] == 5);
}

-(void)testBasicNegative{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-5"] doubleValue] == -5);
}

-(void)testAdvancedNegative{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-2356215"] doubleValue] == -2356215);
}


-(void)testBasicDecimal{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"5.5"] doubleValue] == 5.5);
}

-(void)testBasicNegativeDecimal{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-5.5"] doubleValue] == -5.5);
}

-(void)testAdvancedNegativeDecimal{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-6346346.523423"] doubleValue] == -6346346.523423);
}


-(void)testBasicExponential{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"5e2"] doubleValue] == 500);
}

-(void)testBasicNegativeExponential{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-5e2"] doubleValue] == -500);
}


-(void)testAdvancedNegativeExponential{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-507.25463221e5"] doubleValue] == -50725463.221);
}

-(void)testAdvancedDoubleNegativeExponential{
    XCTAssertTrue([[KinematicSolver convertToDouble: @"-507.25463221e-2"] doubleValue] == -5.0725463221);
}

-(void)testInvalidBasic{
     XCTAssertThrows([[KinematicSolver convertToDouble: @"apple"] doubleValue]);
}

-(void)testInvalidSpaces{
    XCTAssertThrows([[KinematicSolver convertToDouble: @"100 00"] doubleValue]);
}

-(void)testInvalidDoubleNegative{
    XCTAssertThrows([[KinematicSolver convertToDouble: @"-5-52"] doubleValue]);
}

-(void)testInvalidDoubleNegativeExponent{
    XCTAssertThrows([[KinematicSolver convertToDouble: @"-5e-52-3"] doubleValue]);
}

-(void)testInvalidDoubleDecimalExponent{
    XCTAssertThrows([[KinematicSolver convertToDouble: @"5.2e5.2"] doubleValue]);
}

@end
