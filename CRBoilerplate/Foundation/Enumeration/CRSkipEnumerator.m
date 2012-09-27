#import "CRSkipEnumerator.h"

@implementation CRSkipEnumerator
{
	NSEnumerator * _innerEnumerator;
	NSUInteger _skipCount;
	BOOL _skippedAlready;
}

- (id) initWithEnumerator:(NSEnumerator *)enumerator skipCount:(NSUInteger)skipCount
{
	self = [super init];
	if (self)
	{
		_innerEnumerator = enumerator;
		_skipCount = skipCount;
		_skippedAlready = NO;
	}
	return self;
}

- (id) nextObject
{
	if (!_skippedAlready)
	{
		for (NSUInteger i = 0; i < _skipCount; i++)
		{
			[_innerEnumerator nextObject];
		}
		_skippedAlready = YES;
	}
	
	return [_innerEnumerator nextObject];
}

@end
