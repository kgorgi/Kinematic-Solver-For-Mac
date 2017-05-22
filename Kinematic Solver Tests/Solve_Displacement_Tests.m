//
//  Solve_Displacement_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-21.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SolveDisplacement.h"

@interface Solve_Displacement_Tests : XCTestCase{
    @private
        SolveDisplacement* compute;
        double ans;
}

-(void) setValues: (double) t Accel: (double) A InitVelo: (double) Vi FinVelo: (double) Vf Answer: (double) answer;

@end

@implementation Solve_Displacement_Tests

- (void)setUp {
    [super setUp];
    compute = [[SolveDisplacement alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasic{
    [ self setValues:5 Accel:15 InitVelo:30 FinVelo:105 Answer:337.5 ];
    [self computationTests];
}

- (void)testDecimal{
    [ self setValues:5.5 Accel:2 InitVelo:3 FinVelo:14 Answer:46.75 ];
    [ self computationTests ];
}

- (void)testNegative{
    [ self setValues:5 Accel:-6 InitVelo:-4 FinVelo: -34 Answer:-95 ];
    [ self computationTests ];
}

-(void)testDivideByZero{
    NSError* error;
    
    [ self setValues:1 Accel:0 InitVelo:5 FinVelo: 5 Answer:-1 ];
    [ compute setBlankValue:@"time" andError:nil ];
    
    NSNumber* answer = [ compute calculateDisplacement: &error];
    
    if(answer == nil && error != nil){
        return;
    }
    
    XCTFail();
}

-(void) setValues: (double) t Accel: (double) A InitVelo: (double) Vi FinVelo: (double) Vf Answer: (double) answer{
    ans = answer;
    [ compute setTime:[[NSNumber alloc] initWithDouble:t] andError:nil ];
    [ compute setAcceleration: [[NSNumber alloc] initWithDouble: A] ];
    [ compute setInitialVelocity: [[NSNumber alloc] initWithDouble: Vi] ];
    [ compute setFinalVelocity: [[NSNumber alloc] initWithDouble: Vf] ];
}

-(void)computationTests{
    [ compute setBlankValue:@"time" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateDisplacement:nil] doubleValue]);

    [ compute setBlankValue:@"acceleration" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateDisplacement:nil] doubleValue]);

    [ compute setBlankValue:@"InitialVelocity" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateDisplacement:nil] doubleValue]);

    [ compute setBlankValue:@"FinalVelocity" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateDisplacement:nil] doubleValue]);
}

@end
