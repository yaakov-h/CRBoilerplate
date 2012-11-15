//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CREnumerator.h"

@interface CRTransformingEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator transform:(CRSelectBlock)transform;

@end
