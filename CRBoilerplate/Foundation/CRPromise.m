//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CRPromise.h"
#import "CRDeferred.h"

@implementation CRPromise

- (id) initWithDeferred:(CRPromise *)deferred
{
	self = [super init];
	if (self)
	{
		// Must be same reference, not a copy
		errors = deferred->errors;
		successes = deferred->successes;
		successHandlers = deferred->successHandlers;
		failHandlers = deferred->failHandlers;
	}
	return self;
}

- (id) addSuccessHandler:(CRPromiseSuccessHandler)handler
{
	[successHandlers addObject:[handler copy]];
	
	[successes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
	 {
		 handler(obj);
	 }];
	
	return self;
}

- (id) addFailureHandler:(CRPromiseFailureHandler)handler
{
	[failHandlers addObject:[handler copy]];
	
	[errors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
	 {
		 NSError * error = obj;
		 handler(error);
	 }];
	
	return self;
}

- (CRPromise *) pipe:(CRPromiseTransformationHandler)handler
{
	CRDeferred * pipeDeferred = [[CRDeferred alloc] init];
	
	[self addSuccessHandler:^(id data)
	 {
		 NSError * error = nil;
		 id transformedValue = handler(data, &error);
		 
		 if (transformedValue == nil && error != nil)
		 {
			 [pipeDeferred rejectWithError:error];
		 } else {
			 [pipeDeferred resolveWithResult:transformedValue];
		 }
	 }];
	
	[self addFailureHandler:^(NSError *error)
	 {
		 [pipeDeferred rejectWithError:error];
	 }];
	
	return [pipeDeferred promise];
}


@end
