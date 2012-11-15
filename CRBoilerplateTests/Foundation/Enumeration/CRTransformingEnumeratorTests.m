//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+CREnumeration.h"

@interface CRTransformingEnumeratorTests : SenTestCase

@end

@implementation CRTransformingEnumeratorTests

- (void) testTransformStringsToUppercase
{
	NSArray * testData = @[@"one", @"two", @"three", @"four", @"five"];
	NSArray * expected = @[@"ONE", @"TWO", @"THREE", @"FOUR", @"FIVE"];
	
	NSArray * uppercased = [[testData cr_select:^id(id item) { return [item uppercaseString]; }] allObjects];
	
	STAssertEqualObjects(expected, uppercased, @"Uppercased strings should match expected data");
}

@end
