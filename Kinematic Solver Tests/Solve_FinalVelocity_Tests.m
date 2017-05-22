//
//  Solve_Displacement_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-21.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SolveFinalVelocity.h"

@interface Solve_FinalVelocity_Tests : XCTestCase{
    @private
        SolveFinalVelocity* compute;
        double ans;
}

-(void) setValues: (double) t Time: (double) A Accel: (double) Vi InitVelo: (double) Vf Answer: (double) answer;

@end

@implementation Solve_FinalVelocity_Tests

- (void)setUp {
    [super setUp];
    compute = [[SolveFinalVelocity alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasic{
    [ self setValues:337.5 Time:5 Accel:15 InitVelo:30 Answer:105 ];
    [self computationTests];
}

- (void)testDecimal{
    [ self setValues:46.75 Time:5.5 Accel:2 InitVelo:3 Answer:14 ];
    [ self computationTests ];
}

- (void)testNegative{
    [ self setValues:-95 Time:5 Accel:-6 InitVelo: -4 Answer:-34 ];
    [ self computationTests ];
}


-(void)testImpossibleScenario{
    NSError* error;
    
    [ self setValues:1 Time:1 Accel:-5 InitVelo: 0.5 Answer:-1 ];
   
    [ compute setBlankValue:@"Time" andError:nil ];
    
    NSNumber* answer = [ compute calculateFinalVelocity: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 6 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testNoBlankValueSet{
    NSError* error;
    
    compute = [[SolveFinalVelocity alloc] init];
    
    [ self setValues:1 Time:1 Accel:5 InitVelo: 5 Answer:-1 ];
    
    NSNumber* answer = [ compute calculateFinalVelocity: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 5 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void) setValues: (double) D Time: (double) T Accel: (double) A InitVelo: (double) Vi Answer: (double) answer{
    ans = answer;
    [ compute setDisplacement: [[NSNumber alloc] initWithDouble: D ] ];
    [ compute setTime:[[NSNumber alloc] initWithDouble:T ] andError:nil ];
    [ compute setAcceleration: [[NSNumber alloc] initWithDouble: A ] ];
    [ compute setInitialVelocity: [[NSNumber alloc] initWithDouble: Vi ] ];
}

-(void)computationTests{

    [ compute setBlankValue:@"Acceleration" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateFinalVelocity:nil] doubleValue]);

    [ compute setBlankValue:@"Displacement" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateFinalVelocity:nil ] doubleValue]);

    [ compute setBlankValue:@"InitialVelocity" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateFinalVelocity:nil] doubleValue]);
    
    
    //Special Case: t = 0;
    NSError* error;
    
    [ compute setBlankValue:@"Time" andError:&error ];
    
    NSNumber* computeAns = [ compute calculateFinalVelocity: &error];
    
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
