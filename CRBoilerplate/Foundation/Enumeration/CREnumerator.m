//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CREnumerator.h"

@implementation CREnumerator

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
