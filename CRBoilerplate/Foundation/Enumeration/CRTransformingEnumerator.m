//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CRTransformingEnumerator.h"

@implementation CRTransformingEnumerator
{
	NSEnumerator * _innerEnumerator;
	CRSelectBlock _transform;
}

- (id) initWithEnumerator:(NSEnumerator *)enumerator transform:(CRSelectBlock)transform
{
	self = [super init];
	if (self)
	{
		_innerEnumerator = enumerator;
		_transform = [transform copy];
	}
	return self;
}

- (id) nextObject
{
	id nextObject = [_innerEnumerator nextObject];
	if (nextObject != nil)
	{
		nextObject = _transform(nextObject);
	}
	
	return nextObject;
}

@end
