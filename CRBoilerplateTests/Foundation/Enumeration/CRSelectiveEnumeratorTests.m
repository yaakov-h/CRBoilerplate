//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+CREnumeration.h"

@interface CRSelectiveEnumeratorTests : SenTestCase

@end

@implementation CRSelectiveEnumeratorTests

- (void) testFilterListOfStrings
{
	NSArray * testData = @[@"one", @"two", @"three", @"four", @"five"];
	
	NSEnumerator * testDataWhereStringDoesNotContainLowercaseO = [testData cr_where:^(id item){ return [item rangeOfString:@"o"].location == NSNotFound;	}];
	
	NSArray * expected = @[@"three", @"five"];
	STAssertEqualObjects([testDataWhereStringDoesNotContainLowercaseO allObjects], expected, @"Filtered test data should match expected data");
}

@end
