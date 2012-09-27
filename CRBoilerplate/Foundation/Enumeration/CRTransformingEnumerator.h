#import "CREnumerator.h"

@interface CRTransformingEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator transform:(CRSelectBlock)transform;

@end
