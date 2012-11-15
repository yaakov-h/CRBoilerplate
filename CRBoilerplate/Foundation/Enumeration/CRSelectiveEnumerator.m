//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CRSelectiveEnumerator.h"

@implementation CRSelectiveEnumerator
{
	NSEnumerator * _innerEnumerator;
	CRWhereBlock _filter;
}

- (id) initWithEnumerator:(NSEnumerator *)enumerator filter:(CRWhereBlock)filter
{
	self = [super init];
	if (self)
	{
		_innerEnumerator = enumerator;
		_filter = [filter copy];
	}
	return self;
}

- (id) nextObject
{
	id nextObject;
	do
	{
		nextObject = [_innerEnumerator nextObject];
	}
	while (nextObject != nil && !_filter(nextObject));
	
	return nextObject;
}

- (NSArray *) allObjects
{
	NSMutableArray * allObjects = [@[] mutableCopy];
	id nextObject = [self nextObject];
	while (nextObject != nil)
	{
		[allObjects addObject:nextObject];
		nextObject = [self nextObject];
	}
	
	return [allObjects copy];
}

@end
