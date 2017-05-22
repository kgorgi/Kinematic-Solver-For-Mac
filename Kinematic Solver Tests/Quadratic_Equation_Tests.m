//
//  Quadratic_Equation_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-22.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SolveTime.h"

@interface Quadratic_Equation_Tests : XCTestCase

@end

@implementation Quadratic_Equation_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testSameRoots{
    XCTAssertEqual(0, [SolveTime quadEquation:nil A:1 andb:0 withc:0]);
}

-(void)testRoot1{
    XCTAssertEqual(1, [SolveTime quadEquation:nil A:1 andb:0 withc:-1]);
}

-(void)testRoot2{
    XCTAssertEqual(1, [SolveTime quadEquation:nil A:-1 andb:0 withc:1]);
}

-(void)testDifferentRoots{
    NSError* error;
    
    double answer = [SolveTime quadEquation: &error A: 1 andb: -3 withc: 2];
    
    if(answer == -1 && error != nil){
        if([error code] == 8 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            double firstValue = [[[error userInfo] objectForKey: @"FirstValue"] doubleValue ];
            double secondValue = [[[error userInfo] objectForKey: @"SecondValue"] doubleValue ];
            
            if(fabs(firstValue) == 2 && fabs(secondValue) == 1){
                return;
            }
        }
    }
    
    XCTFail();
}


@end
