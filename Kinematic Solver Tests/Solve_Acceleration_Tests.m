//
//  Solve_Displacement_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-21.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SolveAcceleration.h"

@interface Solve_Acceleration_Tests : XCTestCase{
    @private
        SolveAcceleration* compute;
        double ans;
}

-(void) setValues: (double) D Time: (double) T InitVelo: (double) Vi FinVelo: (double) Vf Answer: (double) answer;

@end

@implementation Solve_Acceleration_Tests

- (void)setUp {
    [super setUp];
    compute = [[SolveAcceleration alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasic{
    [ self setValues:337.5 Time:5 InitVelo:30 FinVelo:105 Answer:15 ];
    [self computationTests];
}

- (void)testDecimal{
    [ self setValues:46.75 Time:5.5 InitVelo:3 FinVelo:14 Answer:2 ];
    [ self computationTests ];
}

- (void)testNegative{
    [ self setValues:-95 Time:5 InitVelo:-4 FinVelo: -34 Answer:-6];
    [ self computationTests ];
}

-(void)testDivideByZero{
    NSError* error;
    
    [ self setValues:0 Time:1 InitVelo:5 FinVelo: 5 Answer:-1 ];
    [ compute setBlankValue:@"Time" andError:nil ];
    
    NSNumber* answer = [ compute calculateAcceleration: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 4 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testNoBlankValueSet{
    NSError* error;
    
    compute = [[SolveAcceleration alloc] init];
    
    [ self setValues:0 Time:4 InitVelo:5 FinVelo: 5 Answer:-1 ];
    
    NSNumber* answer = [ compute calculateAcceleration: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 5 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}


-(void) setValues: (double) D Time: (double) T InitVelo: (double) Vi FinVelo: (double) Vf Answer: (double) answer{
    ans = answer;
    [ compute setDisplacement: [[NSNumber alloc] initWithDouble: D] ];
    [ compute setTime:[[NSNumber alloc] initWithDouble:T] andError:nil ];
    [ compute setInitialVelocity: [[NSNumber alloc] initWithDouble: Vi] ];
    [ compute setFinalVelocity: [[NSNumber alloc] initWithDouble: Vf] ];
}

-(void)computationTests{
    [ compute setBlankValue:@"Displacement" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateAcceleration:nil] doubleValue]);
    
    [ compute setBlankValue:@"Time" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateAcceleration:nil] doubleValue]);

    [ compute setBlankValue:@"InitialVelocity" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateAcceleration:nil] doubleValue]);

    [ compute setBlankValue:@"FinalVelocity" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateAcceleration:nil] doubleValue]);
}

@end
