//
//  Solve_Displacement_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-21.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SolveInitialVelocity.h"

@interface Solve_InitialVelocity_Tests : XCTestCase{
    @private
        SolveInitialVelocity* compute;
        double ans;
}

-(void) setValues: (double) t Time: (double) A Accel: (double) Vi FinVelo: (double) Vf Answer: (double) answer;

@end

@implementation Solve_InitialVelocity_Tests

- (void)setUp {
    [super setUp];
    compute = [[SolveInitialVelocity alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasic{
    [ self setValues:337.5 Time:5 Accel:15 FinVelo:105 Answer:30 ];
    [self computationTests];
}

- (void)testDecimal{
    [ self setValues:46.75 Time:5.5 Accel:2 FinVelo:14 Answer:3 ];
    [ self computationTests ];
}

- (void)testNegative{
    [ self setValues:-95 Time:5 Accel:-6 FinVelo: -34 Answer:-4 ];
    [ self computationTests ];
}


-(void)testImpossibleScenario{
    NSError* error;
    
    [ self setValues:1 Time:1 Accel:1 FinVelo: 0.5 Answer:-1 ];
   
    [ compute setBlankValue:@"Time" andError:nil ];
    
    NSNumber* answer = [ compute calculateInitialVelocity: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 6 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testNoBlankValueSet{
    NSError* error;
    
    compute = [[SolveInitialVelocity alloc] init];
    
    [ self setValues:1 Time:1 Accel:5 FinVelo: 5 Answer:-1 ];
    
    NSNumber* answer = [ compute calculateInitialVelocity: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 5 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}



-(void) setValues: (double) D Time: (double) T Accel: (double) A FinVelo: (double) Vf Answer: (double) answer{
    ans = answer;
    [ compute setDisplacement: [[NSNumber alloc] initWithDouble: D ] ];
    [ compute setTime:[[NSNumber alloc] initWithDouble:T ] andError:nil ];
    [ compute setAcceleration: [[NSNumber alloc] initWithDouble: A ] ];
    [ compute setFinalVelocity: [[NSNumber alloc] initWithDouble: Vf ] ];
}

-(void)computationTests{

    [ compute setBlankValue:@"Acceleration" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateInitialVelocity:nil] doubleValue]);

    [ compute setBlankValue:@"Displacement" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateInitialVelocity:nil] doubleValue]);

    [ compute setBlankValue:@"FinalVelocity" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateInitialVelocity:nil] doubleValue]);
    
    
    //Special Case: Time
    NSError* error;
    
    [ compute setBlankValue:@"Time" andError:nil ];
    
    NSNumber* computeAns = [ compute calculateInitialVelocity: &error];
    
    if(computeAns == nil && error != nil){
        if([error code] == 7 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            double firstValue = [[[error userInfo] objectForKey: @"FirstValue"] doubleValue ];
            double secondValue = [[[error userInfo] objectForKey: @"SecondValue"] doubleValue ];
            double absAns = fabs(ans);
            
            if(fabs(firstValue) == absAns && fabs(secondValue) == absAns){
                return;
            }
            
        }
    }
    
    XCTFail();
}

@end
