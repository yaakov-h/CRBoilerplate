//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>

typedef void (^CRPromiseSuccessHandler)(id data);
typedef void (^CRPromiseFailureHandler)(NSError * error);
typedef id (^CRPromiseTransformationHandler)(id data, NSError *__autoreleasing * error);

@interface CRPromise : NSObject
{
@protected
	NSMutableArray * successes;
	NSMutableArray * errors;
	
	NSMutableArray * successHandlers;
	NSMutableArray * failHandlers;
}

- (id) addSuccessHandler:(CRPromiseSuccessHandler)handler;
- (id) addFailureHandler:(CRPromiseFailureHandler)handler;
- (CRPromise *) pipe:(CRPromiseTransformationHandler)handler;

@end
