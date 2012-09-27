#import "CRChainingEnumerator.h"

@implementation CRChainingEnumerator
{
	NSEnumerator * _innerEnumerator;
	NSEnumerator * _currentEnumerator;
}

- (id) initWithEnumerator:(NSEnumerator *)enumerator
{
	self = [super init];
	if (self)
	{
		_innerEnumerator = enumerator;
		_currentEnumerator = [[_innerEnumerator nextObject] objectEnumerator];;
	}
	return self;
}

- (id) nextObject
{
	if (_currentEnumerator == nil)
	{
		return nil;
	}
	
	id nextObject = [_currentEnumerator nextObject];
	if (nextObject == nil)
	{
		_currentEnumerator = [[_innerEnumerator nextObject] objectEnumerator];
		return [self nextObject];
	}
	
	return nextObject;
}

@end
