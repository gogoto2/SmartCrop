//
//  CGRectManipulationTests.m
//  SmartCrop
//
//  Created by Matt Zanchelli on 4/24/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CGRectManipulation.h"

@interface CGRectManipulationTests : XCTestCase

@end

@implementation CGRectManipulationTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCGRectOffsetRectToFitInRect
{
	CGRect rect, offsetRect;
	
	rect = CGRectMake(0, 0, 10, 10);
	offsetRect = CGRectMake(10, 10, 10, 10);
	XCTAssertTrue(CGRectEqualToRect(CGRectOffsetRectToFitInRect(rect, offsetRect), CGRectMake(10, 10, 10, 10)), @"Offset rect not equal to expected rect");
	
	rect = CGRectMake(15, 20, 5, 5);
	offsetRect = CGRectMake(10, 10, 10, 10);
	XCTAssertTrue(CGRectEqualToRect(CGRectOffsetRectToFitInRect(rect, offsetRect), CGRectMake(15, 15, 5, 5)), @"Offset rect not equal to expected rect");
	
	rect = CGRectMake(5, 5, 5, 5);
	offsetRect = CGRectMake(0, 0, 15, 15);
	XCTAssertTrue(CGRectEqualToRect(CGRectOffsetRectToFitInRect(rect, offsetRect), rect), @"Rect should not have changed");
	
	rect = CGRectMake(0, 0, 20, 20);
	offsetRect = CGRectMake(0, 0, 10, 10);
	XCTAssertTrue(CGRectEqualToRect(CGRectOffsetRectToFitInRect(rect, offsetRect), CGRectZero), @"Rect should not be able to fit in rect");
}

- (void)testCGRectScale
{
	CGRect rect, scaledRect;
	
	rect = CGRectMake(0, 0, 20, 20);
	scaledRect = CGRectScale(CGRectMake(0, 0, 10, 10), 2);
	XCTAssertTrue(CGRectEqualToRect(scaledRect, rect), @"Scaled rect not equal to rect");
	
	rect = CGRectMake(20, 20, 20, 20);
	scaledRect = CGRectScale(CGRectMake(10, 10, 10, 10), 2);
	XCTAssertTrue(CGRectEqualToRect(scaledRect, rect), @"Scaled rect not equal to rect");
	
	rect = CGRectMake(-20, -20, 20, 20);
	scaledRect = CGRectScale(CGRectMake(-10, -10, 10, 10), 2);
	XCTAssertTrue(CGRectEqualToRect(scaledRect, rect), @"Scaled rect not equal to rect");
	
	rect = CGRectZero;
	scaledRect = CGRectScale(CGRectMake(10, 10, 10, 10), 0);
	XCTAssertTrue(CGRectEqualToRect(scaledRect, rect), @"Scale of 0 not equal to CGRectZero");
}

- (void)testCGRectScaledRectToFitInRect
{
	
}

- (void)testCGRectCenterRectInRect
{
	
}

@end
