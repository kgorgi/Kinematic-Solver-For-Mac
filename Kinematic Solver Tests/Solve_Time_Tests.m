//
//  Solve_Displacement_Tests.m
//  Kinematic Solver for Mac
//
//  Created by Kian Gorgichuk on 2017-05-21.
//  Copyright © 2017 Kian Gorgichuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SolveTime.h"

@interface Solve_Time_Tests : XCTestCase{
    @private
        SolveTime* compute;
        double ans;
}

-(void) setValues: (double) t Accel: (double) A InitVelo: (double) Vi FinVelo: (double) Vf Answer: (double) answer;

@end

@implementation Solve_Time_Tests

- (void)setUp {
    [super setUp];
    compute = [[SolveTime alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasic{
    [ self setValues:337.5 Accel:15 InitVelo:30 FinVelo:105 Answer:5 ];
    [self computationTests];
}

- (void)testDecimal{
    [ self setValues:46.75 Accel:2 InitVelo:3 FinVelo:14 Answer:5.5 ];
    [ self computationTests ];
}

- (void)testNegative{
    [ self setValues:-95 Accel:-6 InitVelo:-4 FinVelo: -34 Answer:5 ];
    [ self computationTests ];
}


-(void)testNoBlankValueSet{
    NSError* error;
    
    compute = [[SolveTime alloc] init];
    
    [ self setValues:1 Accel:1 InitVelo:5 FinVelo: 5 Answer:-1 ];
    
    NSNumber* answer = [ compute calculateTime: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 5 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}


-(void)testDivideByZeroAccel{
    NSError* error;
    
    [ self setValues:-1 Accel:0 InitVelo:5 FinVelo: 5 Answer:-1 ];
    [ compute setBlankValue:@"Displacement" andError:nil ];
    
    NSNumber* answer = [ compute calculateTime: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 4 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testDivideByZeroVelo{
    NSError* error;
    
    [ self setValues:-1 Accel:2 InitVelo:5 FinVelo: -5 Answer:-1 ];
    [ compute setBlankValue:@"Acceleration" andError:nil ];
    
    NSNumber* answer = [ compute calculateTime: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 4 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testDivideByZeroInitVelo{
    NSError* error;
    
    [ self setValues:5 Accel:0 InitVelo:0 FinVelo: -1 Answer:-1 ];
    [ compute setBlankValue:@"FinalVelocity" andError:nil ];
    
    NSNumber* answer = [ compute calculateTime: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 4 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testDivideByZeroFinVelo{
    NSError* error;
    
    [ self setValues:5 Accel:0 InitVelo:-1 FinVelo: 0 Answer:-1 ];
    [ compute setBlankValue:@"InitialVelocity" andError:nil ];
    
    NSNumber* answer = [ compute calculateTime: &error];
    
    if(answer == nil && error != nil){
        if([error code] == 4 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void)testInvalidScenario{
    NSError* error = nil;
    
    [ self setValues:-1 Accel:13 InitVelo:5 FinVelo: 2 Answer:-1 ];
    [ compute setBlankValue:@"Displacement" andError:nil ];
    
    NSNumber* answer = [ compute calculateTime: &error];

    if(answer == nil && error != nil){
        if([error code] == 6 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
            return;
        }
    }
    
    XCTFail();
}

-(void) setValues: (double) D Accel: (double) A InitVelo: (double) Vi FinVelo: (double) Vf Answer: (double) answer{
    ans = answer;
    [ compute setDisplacement: [[NSNumber alloc] initWithDouble: D ] ];
    [ compute setAcceleration: [[NSNumber alloc] initWithDouble: A ] ];
    [ compute setInitialVelocity:[[NSNumber alloc] initWithDouble: Vi ] ];
    [ compute setFinalVelocity: [[NSNumber alloc] initWithDouble: Vf ] ];
}

-(void)computationTests{

    [ compute setBlankValue:@"Acceleration" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateTime:nil] doubleValue]);

    [ compute setBlankValue:@"Displacement" andError:nil ];
    XCTAssertEqual(ans, [[compute calculateTime:nil] doubleValue]);
    
    
    //Special Case: Initial Velocity
    NSError* error;
    
    [ compute setBlankValue:@"InitialVelocity" andError:nil ];
    
    NSNumber* computeAns = [ compute calculateTime: &error];
    
    if([computeAns doubleValue] != ans){
        if( computeAns == nil && error != nil){
            if([error code] == 8 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
                double firstValue = [[[error userInfo] objectForKey: @"FirstValue"] doubleValue ];
                double secondValue = [[[error userInfo] objectForKey: @"SecondValue"] doubleValue ];
                
                if(firstValue != ans && secondValue != ans){
                    XCTFail();
                }
            } else{
                XCTFail();
            }
        } else{
            XCTFail();
        }
    }
    
    //Special Case: Final Velocity
    error = nil;
    computeAns = nil;
    
    [ compute setBlankValue:@"FinalVelocity" andError:nil];
    computeAns = [ compute calculateTime: &error];
    
    if([computeAns doubleValue] != ans){
        if(computeAns  == nil && error != nil){
            if([error code] == 8 && [[error domain] isEqualToString:@"com.Gorgichuk.KinematicSolver.ErrorDomain"]){
                double firstValue = [[[error userInfo] objectForKey: @"FirstValue"] doubleValue ];
                double secondValue = [[[error userInfo] objectForKey: @"SecondValue"] doubleValue ];
                
                if(firstValue != ans && secondValue != ans){
                    XCTFail();
                }
            } else{
                XCTFail();
            }
        } else{
            XCTFail();
        }
    }
}

@end
