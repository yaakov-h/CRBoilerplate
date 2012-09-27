#import "NSEnumerator+CREnumeration.h"

#import "CRChainingEnumerator.h"
#import "CRSelectiveEnumerator.h"
#import "CRSkipEnumerator.h"
#import "CRTakeEnumerator.h"
#import "CRTransformingEnumerator.h"

@implementation NSEnumerator (CREnumeration)

- (NSEnumerator *) cr_where:(CRWhereBlock)whereFilter
{
	return [[CRSelectiveEnumerator alloc] initWithEnumerator:self filter:whereFilter];
}

- (NSEnumerator *) cr_select:(CRSelectBlock)transformation
{
	return [[CRTransformingEnumerator alloc] initWithEnumerator:self transform:transformation];
}

- (NSEnumerator *) cr_skip:(NSUInteger)skipCount
{
	return [[CRSkipEnumerator alloc] initWithEnumerator:self skipCount:skipCount];
}

- (NSEnumerator *) cr_take:(NSUInteger)takeCount
{
	return [[CRTakeEnumerator alloc] initWithEnumerator:self takeCount:takeCount];
}

- (NSEnumerator *) cr_selectMany
{
	return [[CRChainingEnumerator alloc] initWithEnumerator:self];
}

- (BOOL) cr_any:(CRWhereBlock)whereFilter
{
	id item;
	do
	{
		item = [self nextObject];
		if (item != nil && whereFilter(item))
		{
			return YES;
		}
	} while (item != nil);
	
	return NO;
}

- (BOOL) cr_all:(CRWhereBlock)whereFilter
{
	id item;
	do
	{
		item = [self nextObject];
		if (item != nil && !whereFilter(item))
		{
			return NO;
		}
	} while (item != nil);
	
	return YES;
}

@end
