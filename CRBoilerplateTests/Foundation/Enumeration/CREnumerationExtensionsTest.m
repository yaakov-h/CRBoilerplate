#import <SenTestingKit/SenTestingKit.h>
//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "NSArray+CREnumeration.h"

@interface CREnumerationExtensionsTest : SenTestCase

@end

@implementation CREnumerationExtensionsTest

- (void) testAllOnEmptyArrayReturnsYes
{
	BOOL result = [@[] cr_all:^int(id item){ return NO; }];
	STAssertEquals(YES, result, @"all: on an empty array should return YES since none fail criteria");
}

- (void) testAllFilterPassing
{
	NSArray * data = @[@1, @2, @3, @4, @5];
	BOOL result = [data cr_all:^int(id item) { return [item intValue] < 6; }];
	
	STAssertEquals(YES, result, @"all: test data less than 6");
}

- (void) testAllFilterFailing
{
	NSArray * data = @[@1, @2, @3, @4, @5];
	BOOL result = [data cr_all:^int(id item) { return [item intValue] == 3; }];
	
	STAssertEquals(NO, result, @"all: test data not all 3");
}

- (void) testAnyOnEmptyArrayReturnsNo
{
	BOOL result = [@[] cr_any:^int(id item){ return YES; }];
	STAssertEquals(NO, result, @"any: on an empty array should return NO since none fulfill criteria");
}

- (void) testAnyFilterPassing
{
	NSArray * data = @[@1, @2, @3, @4, @5];
	BOOL result = [data cr_any:^int(id item) { return [item intValue] == 4; }];
	
	STAssertEquals(YES, result, @"all: one item was 4");
}

- (void) testAnyFilterFailing
{
	NSArray * data = @[@1, @2, @3, @4, @5];
	BOOL result = [data cr_all:^int(id item) { return [item intValue] == 99; }];
	
	STAssertEquals(NO, result, @"all: test data did not contain 99");
}

@end
