//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CRTakeEnumerator.h"

@implementation CRTakeEnumerator
{
	NSEnumerator * _innerEnumerator;
	NSUInteger _takeCount;
	NSUInteger _takenCount;
}

- (id) initWithEnumerator:(NSEnumerator *)enumerator takeCount:(NSUInteger)takeCount
{
	self = [super init];
	if (self)
	{
		_innerEnumerator = enumerator;
		_takenCount = 0;
		_takeCount = takeCount;
	}
	return self;
}

- (id) nextObject
{
	if (_takenCount < _takeCount)
	{
		_takenCount++;
		return [_innerEnumerator nextObject];
	}
	
	return nil;
}

@end
