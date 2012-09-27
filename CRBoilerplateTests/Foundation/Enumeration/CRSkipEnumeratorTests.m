#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+CREnumeration.h"

@interface CRSkipEnumeratorTests : SenTestCase

@end

@implementation CRSkipEnumeratorTests

- (void) testSkipSkipsFirstNObjects
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	NSArray * expected = @[@4, @5];
	
	NSEnumerator * skipped = [testData cr_skip:3];
	
	STAssertEqualObjects(expected, [skipped allObjects], @"Actual data should be original data skipping first 3");
}

- (void) testSkipCountReturnsEmptyArray
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	NSArray * expected = @[];
	
	NSEnumerator * skipped = [testData cr_skip:[testData count]];
	
	STAssertEqualObjects(expected, [skipped allObjects], @"Actual data should be empty array");
}

- (void) testSkipZeroReturnsOriginalData
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	
	NSEnumerator * skipped = [testData cr_skip:0];
	
	STAssertEqualObjects(testData, [skipped allObjects], @"Actual data should be original data");
}

- (void) testSkipMoreThanExistsReturnsEmptyArray
{
	NSArray * testData = @[@1, @2, @3, @4, @5];
	NSArray * expected = @[];
	
	NSEnumerator * skipped = [testData cr_skip:18];
	
	STAssertEqualObjects(expected, [skipped allObjects], @"Actual data should be empty array");
}

@end
