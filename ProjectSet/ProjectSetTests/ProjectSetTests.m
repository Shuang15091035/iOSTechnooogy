//
//  ProjectSetTests.m
//  ProjectSetTests
//
//  Created by admin on 2017/10/26.
//  Copyright © 2017年 jpym.product.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSPredicate.h"
#import "SQLiteUsage.h"

@interface ProjectSetTests : XCTestCase

@end

@implementation ProjectSetTests

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
//    LSPredicate *predicate = [LSPredicate new];
//    [predicate predicateFilterArrayObj];
    
    SQLiteUsage *sqlite = [SQLiteUsage new];
    [sqlite openSqlite3];
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
