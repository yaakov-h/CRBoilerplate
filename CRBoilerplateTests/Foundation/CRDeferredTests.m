//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CRDeferred.h"
#import "CRPromise.h"

@interface CRDeferredTests : SenTestCase

@end

@implementation CRDeferredTests

- (void) testResolveCallsSuccess
{
	__block BOOL successCalled = NO;
	CRDeferred * deferred = [[CRDeferred alloc] init];
	[deferred addSuccessHandler:^(id data)
     {
         successCalled = YES;
     }];
	
	STAssertFalse(successCalled, @"Sanity check");
	[deferred resolveWithResult:[NSNull null]];
	STAssertTrue(successCalled, @"Success should have been called");
}

- (void) testRejectCallsFailure
{
	__block BOOL failCalled = NO;
	CRDeferred * deferred = [[CRDeferred alloc] init];
	[deferred addFailureHandler:^(NSError * error)
	 {
		 failCalled = YES;
	 }];
	
	STAssertFalse(failCalled, @"Sanity check");
	[deferred rejectWithError:[[NSError alloc] init]];
	STAssertTrue(failCalled, @"Success should have been called");
}

- (void) testAddSuccessHandlerCallsWithPreviousResults
{
	__block id outerData = nil;
	CRDeferred * deferred = [[CRDeferred alloc] init];
	[deferred resolveWithResult:@"blah"];
	
	STAssertNil(outerData, @"Sanity check");
	
	[deferred addSuccessHandler:^(id data)
     {
         outerData = data;
     }];
	
	STAssertEqualObjects(@"blah", outerData, @"Data should have been passed when adding handler");
}

- (void) testAddFailHandlerCallsWithPreviousResults
{
	NSError * error = [NSError errorWithDomain:@"Test" code:0 userInfo:nil];
	__block NSError * outerError = nil;
	CRDeferred * deferred = [[CRDeferred alloc] init];
	[deferred rejectWithError:error];
	
	STAssertNil(outerError, @"Sanity check");
	
	[deferred addFailureHandler:^(NSError * innerError)
	 {
		 outerError = innerError;
	 }];
	
	STAssertEqualObjects(error, outerError, @"Error should have been passed when adding handler");
}

- (void) testPipeResolution
{
	NSString * initialString = @"blahlah";
	NSString * expectedString = @"blahlahone";
	
	__block NSString * actualString = nil;
	
	CRDeferred * deferred = [[CRDeferred alloc] init];
	[[deferred pipe:^id(id data, NSError *__autoreleasing * error)
      {
          return [data stringByAppendingString:@"one"];
      }] addSuccessHandler:^(id data) {
          actualString = data;
      }];
	
	STAssertNil(actualString, @"Sanity check");
	
	[deferred resolveWithResult:initialString];
	
	STAssertEqualObjects(expectedString, actualString, @"String should have been transformed");
}

- (void) resolvingCallsPromiseSuccessHandlers
{
	__block BOOL handlerCalled = NO;
	CRDeferred * deferred = [[CRDeferred alloc] init];
	CRPromise * promise = [deferred promise];
	[promise addSuccessHandler:^(id data)
     {
         handlerCalled = YES;
     }];
	
	STAssertFalse(handlerCalled, @"Sanity check");
	[deferred resolveWithResult:[NSNull null]];
	STAssertTrue(handlerCalled, @"Handler should have been called");
}

- (void) rejectingCallsPromiseFailHandlers
{
	__block BOOL handlerCalled = NO;
	CRDeferred * deferred = [[CRDeferred alloc] init];
	CRPromise * promise = [deferred promise];
	[promise addFailureHandler:^(NSError * error)
	 {
		 handlerCalled = YES;
	 }];
	
	STAssertFalse(handlerCalled, @"Sanity check");
	[deferred rejectWithError:[[NSError alloc] init]];
	STAssertTrue(handlerCalled, @"Handler should have been called");
}

- (void) promiseReturnedIsSameObject
{
	CRDeferred * deferred = [[CRDeferred alloc] init];
	CRPromise * promise1 = [deferred promise];
	CRPromise * promise2 = [deferred promise];
	
	STAssertEquals(promise1, promise2, @"Promises should be same object reference");
}

@end
