//
//  EasyDispatchTests.m
//  EasyDispatchTests
//
//  Created by ScottLiu on 1/24/18.
//  Copyright © 2018 Scott Liu. All rights reserved.
//

#import "EasyDispatch.h"
#import <XCTest/XCTest.h>
#import <QuartzCore/QuartzCore.h>

@interface EasyDispatchTests : XCTestCase

@end

@implementation EasyDispatchTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *description = [NSString stringWithFormat:@"%s%d", __FUNCTION__, __LINE__];
    XCTestExpectation *exp = [self expectationWithDescription:description];
    printf("==========\n");
    printf("Hello world\n");
    printf("==========\n");
    // CACurrentMediaTime() is a device time that doesn't change with network syncs
    CFTimeInterval startTime = CACurrentMediaTime();
    delay(3, ^{
        CFTimeInterval endTime = CACurrentMediaTime();
        printf("testing 3 secs\n");
        printf("time elapsed %f\n", endTime - startTime);
        [exp fulfill];
    });
    // Wait for the async request to complete
    [self waitForExpectationsWithTimeout:60 handler: nil];
    printf("end\n");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
