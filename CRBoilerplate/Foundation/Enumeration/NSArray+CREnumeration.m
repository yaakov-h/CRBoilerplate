//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "NSArray+CREnumeration.h"
#import "NSEnumerator+CREnumeration.h"

@implementation NSArray (CREnumeration)

- (NSEnumerator *) cr_where:(CRWhereBlock)whereFilter
{
	return [[self objectEnumerator] cr_where:whereFilter];
}

- (NSEnumerator *) cr_select:(CRSelectBlock)transformation
{
	return [[self objectEnumerator] cr_select:transformation];
}

- (NSEnumerator *) cr_skip:(NSUInteger)skipCount
{
	return [[self objectEnumerator] cr_skip:skipCount];
}

- (NSEnumerator *) cr_take:(NSUInteger)takeCount
{
	return [[self objectEnumerator] cr_take:takeCount];
}

- (NSEnumerator *) cr_selectMany
{
	return [[self objectEnumerator] cr_selectMany];
}

- (BOOL) cr_any:(CRWhereBlock)whereFilter
{
	return [[self objectEnumerator] cr_any:whereFilter];
}

- (BOOL) cr_all:(CRWhereBlock)whereFilter
{
	return [[self objectEnumerator] cr_all:whereFilter];
}

- (id) cr_firstObject
{
	return self.count > 0 ? self[0] : nil;
}

@end