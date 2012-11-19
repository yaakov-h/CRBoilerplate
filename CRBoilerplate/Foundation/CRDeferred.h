//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>
#import "CRPromise.h"

@interface CRDeferred : CRPromise

- (id) init;
- (void) resolveWithResult:(id)data;
- (void) rejectWithError:(NSError *)error;

- (CRPromise *) promise;

@end
