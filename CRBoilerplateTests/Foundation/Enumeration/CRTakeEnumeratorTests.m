//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+CREnumeration.h"

@interface CRTakeEnumeratorTests : SenTestCase

@end

@implementation CRTakeEnumeratorTests

- (void) testTakeSameAmount
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	
	NSEnumerator * taken = [testData cr_take:testData.count];
	
	STAssertEqualObjects(testData, [taken allObjects], @"Taking all should return all");
}

- (void) testTakeLess
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	NSArray * expected = @[@1, @2, @3];
	
	NSEnumerator * taken = [testData cr_take:3];
	
	STAssertEqualObjects(expected, [taken allObjects], @"Taking some should only return those");
}

- (void) testTakeMore
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	
	NSEnumerator * taken = [testData cr_take:999999];
	
	STAssertEqualObjects(testData, [taken allObjects], @"Taking more than all should return all");
}

- (void) testTakeZeroReturnsEmptyArray
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	NSArray * expected = @[];
	
	NSEnumerator * taken = [testData cr_take:0];
	
	STAssertEqualObjects(expected, [taken allObjects], @"Taking more than all should return all");
}



@end
