//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CRDeferred.h"

@interface CRPromise ()

- (id) initWithDeferred:(CRPromise *)deferred;

@end

@implementation CRDeferred
{
	CRPromise * _promise;
}

- (id) init
{
	self = [super init];
	if (self)
	{
		successes = [@[] mutableCopy];
		errors = [@[] mutableCopy];
		successHandlers = [@[] mutableCopy];
		failHandlers = [@[] mutableCopy];
		_promise = nil;
	}
	return self;
}


- (void) resolveWithResult:(id)data
{
	[successes addObject:data];
	
	[successHandlers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         CRPromiseSuccessHandler handler = obj;
         handler(data);
     }];
}

- (void) rejectWithError:(NSError *)error
{
	[errors addObject:error];
	
	[failHandlers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
	 {
		 CRPromiseFailureHandler handler = obj;
		 handler(error);
	 }];
}

- (CRPromise *) promise
{
	if (_promise == nil)
	{
		_promise = [[CRPromise alloc] initWithDeferred:self];
	}
	return _promise;
}

@end
