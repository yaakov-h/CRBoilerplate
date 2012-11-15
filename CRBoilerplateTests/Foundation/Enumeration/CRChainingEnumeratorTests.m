//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+CREnumeration.h"

@interface CRChainingEnumeratorTests : SenTestCase

@end


@implementation CRChainingEnumeratorTests

- (void) testChainingArrays
{
	NSArray * testData = @[ @[@1, @2], @[@3], @[@4, @5] ];
	NSArray * expected = @[ @1, @2, @3, @4, @5 ];
	
	NSEnumerator * selectMany = [testData cr_selectMany];
	
	STAssertEqualObjects(expected, [selectMany allObjects], @"selectMany should contain all items in all subarrays");
}

- (void) testChainingEmptyArrays
{
	NSArray * testData = @[ @[], @[], @[], @[] ];
	NSArray * expected = @[];
	
	NSEnumerator * selectMany = [testData cr_selectMany];
	
	STAssertEqualObjects(expected, [selectMany allObjects], @"selectMany should contain no items");
}

- (void) testChainingMixedArrays
{
	NSArray * testData = @[ @[@1, @2], @[], @[@3, @4], @[] ];
	NSArray * expected = @[@1, @2, @3, @4];
	
	NSEnumerator * selectMany = [testData cr_selectMany];
	
	STAssertEqualObjects(expected, [selectMany allObjects], @"selectMany should contain all items in populated subarrays");
}

@end
